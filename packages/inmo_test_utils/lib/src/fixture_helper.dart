import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

part 'fixtures/json_reader.dart';
part 'fixtures/image_reader.dart';
part 'fixtures/video_reader.dart';

const String _basePath = 'packages/inmo_test_utils/lib/src/fixtures';

String _fixtureString(String filePath) {
  return File('$_basePath$filePath').readAsStringSync();
}

Uint8List _fixtureBytes(String name) {
  return File('$_basePath$name').readAsBytesSync();
}

abstract class Fixture<T> {
  T decode(String fileName);
}