# Running tests

## Unit tests and Widget tests


## Integration tests locally
1. Get devices
``` bash
marlonsubuyu@Mac inmo_mobile % patrol devices
SM S901U (10.0.0.32:39803)
sdk gphone64 arm64 (emulator-5554)
iPhone 16 Plus (63A0D325-6A2F-4401-9B34-ED8E7B287B07)
macOS (macos)
```
| Device                | Id                                    |
| ----------------------| --------------------------------------|
| SM S901U              | 10.0.0.32:39803                       |
| sdk gphone64 arm64    | emulator-5554                         |
| iPhone 16 Plus        | 63A0D325-6A2F-4401-9B34-ED8E7B287B07  |

2. Run tests
``` bash
patrol test
```

``` bash
# Copy the device id and paste it between the single quotes
# You don't need to specify verbose flag unless you want to see the logs
patrol test -t integration_test/features/auth/sign_up/sign_up_test.dart --verbose --device='iPhone 16 Pro Max'

# 🍎 iOS Simulator
patrol test -t integration_test/features/auth/sign_up/sign_up_test.dart --verbose --device='iPhone 16 Pro Max'

# 🍎 iOS Physical Device
patrol test -t integration_test/features/auth/sign_up/sign_up_test.dart --verbose --device='Marlon Subuyú’s iPhone' --release

# 🤖 Android Emulator
patrol test -t integration_test/features/auth/sign_up/sign_up_test.dart --verbose --device='sdk gphone64 arm64'

# 🤖 Android Physical Device
patrol test -t integration_test/features/auth/sign_up/sign_up_test.dart --verbose --device='SM F936U'

patrol test -t integration_test/features/auth/sign_up/sign_up_test.dart --verbose --device='SM S901U'
```

## Integration tests on Firebase Test Lab

1. Generate test devices
``` bash
dart scripts/generate_test_devices.dart
```

2. Run tests

**Run tests on Android**
``` bash
./scripts/run_android_testlab.sh
```

**Run tests on iOS**
``` bash
./scripts/run_ios_testlab.sh
```