abstract class FirebaseTestLabDevice {
  final String modelId;
  final List<String> osVersionIds;
  final List<String> tags;

  const FirebaseTestLabDevice({
    required this.modelId,
    required this.osVersionIds,
    required this.tags,
  });

  /// Creates a device string in the format required by Firebase Test Lab
  String toTestLabFormat({required String version, String locale = 'en', String orientation = 'portrait'}) {
    // Validate that the requested version is supported
    if (!osVersionIds.contains(version)) {
      throw ArgumentError('Version $version is not supported for device $modelId. Supported versions: $osVersionIds');
    }

    return 'model=$modelId,version=$version,locale=$locale,orientation=$orientation';
  }

  /// Parse a list of devices from the raw text format
  static List<T> parseDeviceList<T extends FirebaseTestLabDevice>({
    required String rawText,
    required T Function(Map<String, String> deviceData) createDevice,
  }) {
    final devices = <T>[];
    final deviceBlocks = rawText.split('\n\n');

    for (final block in deviceBlocks) {
      if (block.trim().isEmpty) continue;

      final lines = block.split('\n');
      final Map<String, String> deviceData = {};

      for (final line in lines) {
        if (line.trim().isEmpty) continue;
        final parts = line.split(':');
        if (parts.length != 2) continue;

        final key = parts[0].trim();
        final value = parts[1].trim();
        deviceData[key] = value;
      }

      if (deviceData.containsKey('MODEL_ID')) {
        devices.add(createDevice(deviceData));
      }
    }

    return devices;
  }

  /// Get devices that support a specific OS version
  static List<T> getDevicesByOSVersion<T extends FirebaseTestLabDevice>(List<T> devices, String version) {
    return devices.where((device) => device.osVersionIds.contains(version)).toList();
  }

  /// Get stable devices (excluding preview/beta versions)
  static List<T> getStableDevices<T extends FirebaseTestLabDevice>(List<T> devices) {
    return devices.where((device) => 
      !device.tags.any((tag) => tag.contains('preview') || tag.contains('beta'))).toList();
  }
} 