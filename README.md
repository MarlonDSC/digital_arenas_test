# Gusto Master Mobile

## Overview
A Flutter-based mobile application for Gusto Master platform.

## Getting Started

### Prerequisites
- Flutter SDK (see [pubspec.yaml](pubspec.yaml))
- Android Studio / Xcode

### Installation
1. Clone the repository
```bash
git clone https://github.com/MarlonDSC/digital_arenas_test.git
cd digital_arenas_test
```

2. Install dependencies
```bash
flutter pub get
```

3. Generate files
```bash
dart run build_runner build --delete-conflicting-outputs
```

## Development

### Running the app
```bash
# Debug mode
flutter run

# Release mode
flutter run --release
```

### Project Structure
```
lib/
├── core/           # Core functionality, shared components
|__/core/constants/ # Constants
|__/core/errors/    # Errors
|__/core/inmo.dart  # Inmo
|__/core/router/    # Router
|__/core/theme/     # Theme
|__/core/utils/     # Utils
├── features/       # Feature modules
|__/features/breeds/
|__/features/breeds/data/ # Data access layer (API, local storage, etc.)
|__/features/breeds/domain/ # Business logic
|__/features/breeds/presentation/ # UI
|__/features/favourite/
|__/features/start/
├── l10n/          # Localization files
└── main.dart      # Application entry point
```

## Testing

```bash
flutter test
```

### Unit tests
These tests cover from Data stores, Repos, UseCases, Cubits, etc.

There is also a golden test to check the UI of the app.