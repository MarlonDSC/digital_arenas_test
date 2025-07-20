enum FileType {
  takePhoto,
  takeVideo,
  chooseFromGallery,
  chooseFromVideo;

  bool get isImage => this == takePhoto || this == chooseFromGallery;
  bool get isVideo => this == takeVideo || this == chooseFromVideo;
}
