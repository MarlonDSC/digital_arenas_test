# Inmo Test Utils

A package containing test utilities for the Inmo Mobile app.

## Features

- Fixture helpers for loading test data
- JSON reader for parsing test JSON files
- Image reader for loading test images
- Video reader for loading test videos

## Usage

Add this package to your `pubspec.yaml`:

```yaml
dev_dependencies:
  inmo_test_utils:
    path: packages/inmo_test_utils
```

Then import it in your test files:

```dart
import 'package:inmo_test_utils/inmo_test_utils.dart';
```

### Reading JSON Fixtures

```dart
final jsonReader = JsonReader();
final data = jsonReader.decode('your_fixture.json');
```

### Reading Image Fixtures

```dart
final imageReader = ImageReader();
final imageBytes = imageReader.decode('your_image.png');
```

### Reading Video Fixtures

```dart
final videoReader = VideoReader();
final videoBytes = videoReader.decode('your_video.mp4');
```

## Directory Structure

Place your test fixtures in the following directory structure:

```
test/
  fixtures/
    json/
      your_fixture.json
    image/
      your_image.png
    video/
      your_video.mp4
``` 