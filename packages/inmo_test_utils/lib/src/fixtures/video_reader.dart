part of '../fixture_helper.dart';

class VideoReader implements Fixture<Uint8List> {
  @override
  Uint8List decode(String fileName) {
    return _fixtureBytes('/file/video/$fileName');
  }
} 