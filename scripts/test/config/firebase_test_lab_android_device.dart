import 'firebase_test_lab_device_base.dart';

class FirebaseTestLabAndroidDevice extends FirebaseTestLabDevice {
  final String make;
  final String modelName;
  final String form;
  final String resolution;

  const FirebaseTestLabAndroidDevice({
    required super.modelId,
    required this.make,
    required this.modelName,
    required this.form,
    required this.resolution,
    required super.osVersionIds,
    required super.tags,
  });

  /// Creates a device string in the format required by Firebase Test Lab
  @override
  String toTestLabFormat({required String version, String locale = 'en', String orientation = 'portrait'}) {
    // Validate that the requested version is supported
    if (!osVersionIds.contains(version)) {
      throw ArgumentError('Version $version is not supported for device $modelId. Supported versions: $osVersionIds');
    }

    return 'model=$modelId,version=$version,locale=$locale,orientation=$orientation';
  }

  /// Parse a list of devices from the raw text format
  static List<FirebaseTestLabAndroidDevice> parseDeviceList(String rawText) {
    return FirebaseTestLabDevice.parseDeviceList<FirebaseTestLabAndroidDevice>(
      rawText: rawText,
      createDevice: (deviceData) => FirebaseTestLabAndroidDevice(
        modelId: deviceData['MODEL_ID'] ?? '',
        make: deviceData['MAKE'] ?? '',
        modelName: deviceData['MODEL_NAME'] ?? '',
        form: deviceData['FORM'] ?? '',
        resolution: deviceData['RESOLUTION'] ?? '',
        osVersionIds: deviceData['OS_VERSION_IDS']?.split(',').map((e) => e.trim()).toList() ?? [],
        tags: deviceData['TAGS']?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList() ?? [],
      ),
    );
  }

  /// Get all physical devices
  static List<FirebaseTestLabAndroidDevice> getPhysicalDevices(List<FirebaseTestLabAndroidDevice> devices) {
    return devices.where((device) => device.form == 'PHYSICAL').toList();
  }

  /// Get all virtual devices
  static List<FirebaseTestLabAndroidDevice> getVirtualDevices(List<FirebaseTestLabAndroidDevice> devices) {
    return devices.where((device) => device.form == 'VIRTUAL').toList();
  }

  /// Get devices by manufacturer
  static List<FirebaseTestLabAndroidDevice> getDevicesByMake(List<FirebaseTestLabAndroidDevice> devices, String make) {
    return devices.where((device) => device.make.toLowerCase() == make.toLowerCase()).toList();
  }

  /// Get devices that support a specific Android version
  static List<FirebaseTestLabAndroidDevice> getDevicesByAndroidVersion(List<FirebaseTestLabAndroidDevice> devices, String version) {
    return FirebaseTestLabDevice.getDevicesByOSVersion(devices, version);
  }

  @override
  String toString() {
    return 'FirebaseTestLabAndroidDevice(modelId: $modelId, make: $make, modelName: $modelName, form: $form, resolution: $resolution, osVersionIds: $osVersionIds, tags: $tags)';
  }
} 