import 'firebase_test_lab_device_base.dart';

class FirebaseTestLabIOSDevice extends FirebaseTestLabDevice {
  final String name;

  const FirebaseTestLabIOSDevice({
    required super.modelId,
    required this.name,
    required super.osVersionIds,
    required super.tags,
  });

  /// Creates a device string in the format required by Firebase Test Lab
  @override
  String toTestLabFormat({required String version, String locale = 'en_US', String orientation = 'portrait'}) {
    // Validate that the requested version is supported
    if (!osVersionIds.contains(version)) {
      throw ArgumentError('Version $version is not supported for device $modelId. Supported versions: $osVersionIds');
    }

    return 'model=$modelId,version=$version,locale=$locale,orientation=$orientation';
  }

  /// Parse a list of devices from the raw text format
  static List<FirebaseTestLabIOSDevice> parseDeviceList(String rawText) {
    return FirebaseTestLabDevice.parseDeviceList<FirebaseTestLabIOSDevice>(
      rawText: rawText,
      createDevice: (deviceData) => FirebaseTestLabIOSDevice(
        modelId: deviceData['MODEL_ID'] ?? '',
        name: deviceData['NAME'] ?? '',
        osVersionIds: deviceData['OS_VERSION_IDS']?.split(',').map((e) => e.trim()).toList() ?? [],
        tags: deviceData['TAGS']?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList() ?? [],
      ),
    );
  }

  /// Get devices by iOS version
  static List<FirebaseTestLabIOSDevice> getDevicesByIOSVersion(List<FirebaseTestLabIOSDevice> devices, String version) {
    return FirebaseTestLabDevice.getDevicesByOSVersion(devices, version);
  }

  /// Get devices by name pattern
  static List<FirebaseTestLabIOSDevice> getDevicesByNamePattern(List<FirebaseTestLabIOSDevice> devices, String pattern) {
    return devices.where((device) => 
      device.name.toLowerCase().contains(pattern.toLowerCase())).toList();
  }

  /// Get stable devices (excluding preview/beta versions)
  static List<FirebaseTestLabIOSDevice> getStableDevices(List<FirebaseTestLabIOSDevice> devices) {
    return FirebaseTestLabDevice.getStableDevices(devices);
  }

  @override
  String toString() {
    return 'FirebaseTestLabIOSDevice(modelId: $modelId, name: $name, osVersionIds: $osVersionIds, tags: $tags)';
  }
} 