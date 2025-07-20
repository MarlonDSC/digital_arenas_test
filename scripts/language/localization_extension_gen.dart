// ignore_for_file: avoid_print

import 'dart:io';

import 'package:fpdart/fpdart.dart';

/// Constants for file paths and patterns
class Constants {
  static const String errorFilePattern = '_error.dart';
  static const String unknownErrorKey = 'errorUnknown';
}

/// Represents paths to important files and directories in the project
class ProjectPaths {
  final Directory valueObjectErrorsDir;
  final File valueObjectErrorsImportFile;
  final File appLocalizationExtensionFile;

  ProjectPaths._({
    required this.valueObjectErrorsDir,
    required this.valueObjectErrorsImportFile,
    required this.appLocalizationExtensionFile,
  });

  /// Creates ProjectPaths instance with paths relative to the current directory
  factory ProjectPaths.fromCurrentDir() {
    // Get the current directory path
    var path = Directory.current.path;
    // Use the current directory as the root path since we're already in the project root
    var rootPath = path;
    return ProjectPaths._(
      valueObjectErrorsDir: Directory(
        '$rootPath/lib/core/errors/value_object_errors',
      ),
      valueObjectErrorsImportFile: File(
        '$rootPath/lib/core/errors/value_object_errors/value_object_errors_import.dart',
      ),
      appLocalizationExtensionFile: File(
        '$rootPath/lib/core/extensions/app_localization_extension.dart',
      ),
    );
  }
}

/// Finds all error files in the specified directory
List<File> findErrorFiles(Directory directory) {
  return directory
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith(Constants.errorFilePattern))
      .toList();
}

/// Finds all error files from the import file
List<File> findErrorFilesFromImport(File importFile) {
  final content = importFile.readAsStringSync();
  final imports =
      RegExp(
        r"export '(\w+_error\.dart)';",
      ).allMatches(content).map((m) => m.group(1)!).toList();

  final dir = importFile.parent;
  return imports.map((fileName) => File('${dir.path}/$fileName')).toList();
}

/// Generates import statements for error files
String generateImports(List<File> errorFiles) {
  return errorFiles
      .map((f) {
        final regex = RegExp(r'[^\\/]+$');
        String fileName = '';
        final match = regex.firstMatch(f.path);
        if (match != null) {
          var tempFileName = match.group(0);
          if (tempFileName != null) {
            fileName = tempFileName;
          } else {
            print('❌ No fileName found to generate import');
          }
        }
        return "export '$fileName';";
      })
      .join('\n');
}

/// Extracts error details from a file's content
class ErrorFileDetails {
  final String errorType;
  final List<String> codes;
  final List<String> connectionCodes;
  final List<String> serverCodes;
  final List<String> externalCodes;
  final List<String> constants;

  ErrorFileDetails({
    required this.errorType,
    required this.codes,
    required this.connectionCodes,
    required this.serverCodes,
    required this.externalCodes,
    required this.constants,
  });

  static ErrorFileDetails fromContent(String content) {
    final classStart = content.indexOf('class');
    final classEnd = content.lastIndexOf('}');
    final classContent = content.substring(classStart, classEnd);

    final constants =
        RegExp(
          r'static const ErrorDetail (\w+) =',
        ).allMatches(classContent).map((m) => m.group(1)!).toList();

    final codes =
        RegExp(
          r"ErrorDetail\.validation\(\s*'(\w+)'",
        ).allMatches(classContent).map((m) => m.group(1)!).toList();

    final connectionCodes =
        RegExp(
          r"ErrorDetail\.connection\(\s*'(\w+)'",
        ).allMatches(classContent).map((m) => m.group(1)!).toList();

    final serverCodes =
        RegExp(
          r"ErrorDetail\.server\(\s*'(\w+)'",
        ).allMatches(classContent).map((m) => m.group(1)!).toList();

    final externalCodes =
        RegExp(
          r"ErrorDetail\.external\(\s*'(\w+)'",
        ).allMatches(classContent).map((m) => m.group(1)!).toList();

    final errorType =
        RegExp(r'class (\w+)Error').firstMatch(classContent)?.group(1) ?? '';

    return ErrorFileDetails(
      errorType: errorType,
      codes: codes,
      connectionCodes: connectionCodes,
      serverCodes: serverCodes,
      externalCodes: externalCodes,
      constants: constants,
    );
  }

  String generateErrorCases() {

    if (codes.isEmpty && connectionCodes.isEmpty && externalCodes.isEmpty) {
      print('⚠️ Warning: No codes found for $errorType ⚠️');
      return '';
    }

    final validationCases = codes
        .mapWithIndex(
          (code, index) => '''
      '$code' => AppLocalizations.of(context)!.$code,''',
        )
        .join('\n');

    final connectionCases = connectionCodes
        .mapWithIndex(
          (code, index) => '''
      '$code' => AppLocalizations.of(context)!.$code,''',
        )
        .join('\n');

    final serverCases = serverCodes
        .mapWithIndex(
          (code, index) => '''
      '$code' => AppLocalizations.of(context)!.$code,''',
        )
        .join('\n');

    final externalCases = externalCodes
        .mapWithIndex(
          (code, index) => '''
      '$code' => AppLocalizations.of(context)!.$code,''',
        )
        .join('\n');

    return [
      validationCases,
      connectionCases,
      serverCases,
      externalCases,
    ].where((cases) => cases.isNotEmpty).join('\n');
  }
}

/// Removes the existing error cases from the app localization extension file
void removeExistingErrorCases(File file) {
  var content = file.readAsStringSync();
  final switchStart = content.indexOf('return switch (error.code) {');
  if (switchStart == -1) {
    // If pattern not found, return without modifying
    return;
  }

  final switchEnd = content.indexOf('    };', switchStart);
  if (switchEnd == -1) {
    // If closing pattern not found, return without modifying
    return;
  }

  content = content.replaceRange(
    switchStart,
    switchEnd + 2,
    'return switch (error.code) {',
  );

  file.writeAsStringSync(content);
}

/// Updates the app localization extension file with error cases
void updateLocalizationExtension(File file, String errorCases) {
  var content = file.readAsStringSync();

  // Add error cases
  content = content.replaceAll(
    'return switch (error.code) {  };',
    'return switch (error.code) {\n$errorCases\n      _ => AppLocalizations.of(context)!.${Constants.unknownErrorKey},\n    };',
  );

  file.writeAsStringSync(content);
}

void main() {
  try {
    final paths = ProjectPaths.fromCurrentDir();

    // First find all error files in the directory
    final allErrorFiles = findErrorFiles(paths.valueObjectErrorsDir);

    // Update the import file with all error files
    final imports = generateImports(allErrorFiles);
    paths.valueObjectErrorsImportFile.writeAsStringSync(imports);

    // Then process the files from the import file
    final errorFiles = findErrorFilesFromImport(
      paths.valueObjectErrorsImportFile,
    );

    // Process error files and generate cases
    final errorCases = errorFiles
        .map((f) => ErrorFileDetails.fromContent(f.readAsStringSync()))
        .map((details) => details.generateErrorCases())
        .where((cases) => cases.isNotEmpty)
        .join('\n');

    removeExistingErrorCases(paths.appLocalizationExtensionFile);
    updateLocalizationExtension(paths.appLocalizationExtensionFile, errorCases);

    print('Localization files generated successfully! ✅');
  } catch (e) {
    print('Error generating localization files: $e ❌');
    exit(1);
  }
}
