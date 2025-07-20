import 'dart:io';

const _patrolImport = "import 'package:patrol_finders/patrol_finders.dart';";

void main() {
  final dir = Directory.current;

  final stepFiles = _findStepFiles(dir);
  _addImportToFiles(stepFiles);

  final featureFile = _findFeatureFile(stepFiles.first);
  _addImportToFile(featureFile);
}

List<File> _findStepFiles(Directory dir) {
  return dir
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (d) =>
            d.path.contains('test/features/') &&
            d.path.contains('presentation/ui/') &&
            d.path.contains('step/') &&
            d.path.endsWith('.dart'),
      )
      .toList();
}

void _addImportToFiles(List<File> files) {
  for (final file in files) {
    _addImportToFile(file);
  }
}

void _addImportToFile(File file) {
  final content = file.readAsStringSync();
  if (!content.contains(_patrolImport)) {
    final newContent = '$_patrolImport\n\n$content';
    file.writeAsStringSync(newContent);
  }
}

File _findFeatureFile(File stepFile) {
  final featureFilePath = stepFile.parent.parent;
  final featureFiles = Directory(featureFilePath.path)
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.feature'))
      .toList();
  return featureFiles.first;
}
