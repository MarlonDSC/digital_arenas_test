# Inmo Test Helpers

A package containing test helpers and steps for the Inmo Mobile app.

## Features

- Dependency injection helpers for tests
- Mock objects for testing
- BDD-style test steps
- Authentication test steps

## Usage

Add this package to your `pubspec.yaml`:

```yaml
dev_dependencies:
  inmo_test_helpers:
    path: packages/inmo_test_helpers
```

### Using DI Helper

```dart
import 'package:inmo_test_helpers/inmo_test_helpers.dart';

void main() {
  setUp(() async {
    await setupDiHelper('/initial-route');
  });
}
```

### Using Test Steps

```dart
import 'package:inmo_test_helpers/inmo_test_helpers.dart';

void main() {
  testWidgets('User can sign up successfully', (tester) async {
    await AuthSteps.givenUserIsOnSignUpScreen(tester);
    await AuthSteps.whenUserFillsSignUpForm(
      tester,
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
    );
    await AuthSteps.thenSignUpIsSuccessful(tester);
  });
}
```

## Dependencies

This package depends on:
- flutter_test
- mockito
- get_it
- bloc_test
- inmo_test_utils 