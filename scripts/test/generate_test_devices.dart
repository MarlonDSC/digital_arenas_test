import 'dart:developer';
import 'dart:io';

import 'config/firebase_test_lab_android_device.dart';
import 'config/firebase_test_lab_ios_device.dart';

void main() async {
  // Read the Android devices list
  var basePath = 'scripts/config';
  var devicesPath = '$basePath/devices';
  final androidDevicesFile = File('$devicesPath/test_android_devices.txt');
  if (!androidDevicesFile.existsSync()) {
    log('Error: test_android_devices.txt not found');
    exit(1);
  }

  // Read the iOS devices list
  final iosDevicesFile = File('$devicesPath/test_ios_devices.txt');
  if (!iosDevicesFile.existsSync()) {
    log('Error: test_ios_devices.txt not found');
    exit(1);
  }

  // Parse Android devices
  final rawAndroidDevices = androidDevicesFile.readAsStringSync();
  final androidDevices = FirebaseTestLabAndroidDevice.parseDeviceList(rawAndroidDevices);

  // Parse iOS devices
  final rawIOSDevices = iosDevicesFile.readAsStringSync();
  final iosDevices = FirebaseTestLabIOSDevice.parseDeviceList(rawIOSDevices);

  // Get modern Android physical devices
  final modernPhysicalDevices = FirebaseTestLabAndroidDevice.getPhysicalDevices(androidDevices)
      .where((device) => device.osVersionIds.contains('34'))
      .toList();

  // Get Android devices by manufacturer
  final samsungDevices = FirebaseTestLabAndroidDevice.getDevicesByMake(modernPhysicalDevices, 'Samsung');
  final googleDevices = FirebaseTestLabAndroidDevice.getDevicesByMake(modernPhysicalDevices, 'Google');
  
  // Select Android devices for testing
  final selectedAndroidDevices = [
    if (googleDevices.isNotEmpty) googleDevices.first,
    if (samsungDevices.isNotEmpty) samsungDevices.first,
  ];

  // Get stable iOS devices
  final stableIOSDevices = FirebaseTestLabIOSDevice.getStableDevices(iosDevices);
  
  // Get iOS devices that support version 16.6
  final ios16Devices = FirebaseTestLabIOSDevice.getDevicesByIOSVersion(stableIOSDevices, '16.6');
  
  // Select newest and oldest supported devices for better coverage
  final selectedIOSDevices = [
    ios16Devices.firstWhere(
      (device) => device.name.contains('14 Pro'),
      orElse: () => ios16Devices.first,
    ),
    stableIOSDevices.firstWhere(
      (device) => device.name.contains('8'),
      orElse: () => stableIOSDevices.last,
    ),
  ];

  // Generate .env content
  final envContent = '''
# Android devices
ANDROID_DEVICE_1="${selectedAndroidDevices[0].toTestLabFormat(version: '34')}"
ANDROID_DEVICE_2="${selectedAndroidDevices.length > 1 ? selectedAndroidDevices[1].toTestLabFormat(version: '34') : selectedAndroidDevices[0].toTestLabFormat(version: '34')}"

# iOS devices
IOS_DEVICE_1="${selectedIOSDevices[0].toTestLabFormat(version: '16.6')}"
IOS_DEVICE_2="${selectedIOSDevices[1].toTestLabFormat(version: selectedIOSDevices[1].osVersionIds.contains('16.6') ? '16.6' : '15.7')}"

# Test configuration
TEST_TIMEOUT="5m"
''';

  // Write to .env.example
  File('.env.example').writeAsStringSync(envContent);
  
  // If .env doesn't exist, create it
  final envFile = File('.env');
  if (!envFile.existsSync()) {
    envFile.writeAsStringSync(envContent);
  }

  log('Device configuration generated successfully!');
  log('\nSelected Android devices:');
  for (final device in selectedAndroidDevices) {
    log('- ${device.make} ${device.modelName} (${device.modelId})');
  }
  log('\nSelected iOS devices:');
  for (final device in selectedIOSDevices) {
    log('- ${device.name} (${device.modelId})');
  }
} 