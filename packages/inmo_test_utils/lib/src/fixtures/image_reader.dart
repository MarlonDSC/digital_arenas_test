part of '../fixture_helper.dart';

class ImageReader implements Fixture<Uint8List> {
  static const String oneKb = '1kb.png';
  static const String corrupted = 'corrupted.jpg';
  static const String profilePicture = 'profile-picture.jpg';

  @override
  Uint8List decode(String fileName) {
    return _fixtureBytes('/file/image/$fileName');
  }

  Future<File> decodeFile(String fileName) async {
    return File.fromRawPath(decode(fileName));
  }
}