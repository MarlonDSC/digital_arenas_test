# Inmo Mobile

## Overview
A Flutter-based mobile application for Inmo platform.

## Documentation & Resources

### Project Documentation
- 📱 Mobile App (current repository)
  - [Project Wiki](https://github.com/CodeFlow-Dynamics/inmo_mobile/wiki) - Detailed technical documentation and guides
  - [Project Board](https://github.com/CodeFlow-Dynamics/inmo_mobile/projects) - Feature tracking and SRS documentation
- 🗄️ [Backend Repository](https://github.com/CodeFlow-Dynamics/InmoBackend) - API and server-side implementation

### Feature Documentation
Each feature's detailed specifications (SRS) can be found in the corresponding GitHub Project card. This includes:
- User stories
- Technical requirements
- API specifications
- UI/UX designs
- Test scenarios

## Getting Started

### Prerequisites
- Flutter SDK (see [pubspec.yaml](pubspec.yaml))
- Android Studio / Xcode
- iOS development setup (for iOS builds)
- Android development setup (for Android builds)

### Installation
1. Clone the repository
```bash
git clone https://github.com/CodeFlow-Dynamics/inmo_mobile.git
cd inmo_mobile
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
├── features/       # Feature modules
├── l10n/          # Localization files
└── main.dart      # Application entry point
```

## Testing
We have comprehensive documentation for testing:

- [Running Tests](test/RUNNING.md) - How to run unit, widget, and integration tests
- [Writing Tests](test/WRITING.md) - Guidelines and best practices for writing tests
- [Debugging Tests](test/DEBUGGING.md) - Tips for debugging tests and testing deep links