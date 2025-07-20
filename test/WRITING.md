# Writing tests
- Follow the `Arrange-Act-Assert` (AAA) pattern.
- Mock dependencies using `mockito`.
- Use `approval_tests` to test the output of functions.

### Test cases for dto
1. Basic serialization
2. Complex email serialization
3. JSON roundtrip
4. FromJson factory
5. ToJson method

### Test cases for value objects
1. Happy path
2. Edge cases

### Test cases for bloc

1. Mock dependencies using [`test_helper.dart`](../test/utils/test_helper.dart)
2. Test bloc initialization
3. Test bloc event handling
4. Test bloc state handling

### Test cases for repository

1. Test repository initialization
2. Test repository method handling

### Integration tests

1. Get a list of available devices

<details>
<summary>Click to expand list of available devices</summary>

input:
``` bash
idb list-targets
```
output:
``` bash
Marlon Subuyú’s iPhone | 00008101-001C348E2660001E | Booted | device | iOS 18.4.1 | arm64e | No Companion Connected
iPad (A16) | 958F1594-1D75-44BE-8235-8277C77B165E | Shutdown | simulator | iOS 18.4 | x86_64 | No Companion Connected
iPad Pro 11-inch (M4) | 6F8FD4E7-CF73-4906-B44B-72432F0C486F | Shutdown | simulator | iOS 18.4 | x86_64 | No Companion Connected
iPad Pro 13-inch (M4) | 71DB3EA7-C5C5-40CE-B804-393A428FAD0A | Shutdown | simulator | iOS 18.4 | x86_64 | No Companion Connected
```
| Device                    | UUID                                  | Status    | Type          | iOS       | Architecture  | Companion                                         |
|---------------------------|---------------------------------------|-----------|---------------|-----------|---------------|---------------------------------------------------|
| Marlon Subuyú’s iPhone    | 00008101-001C348E2660001E             | Booted    | device        | iOS 18.4.1| arm64e        | /tmp/idb/00008101-001C348E2660001E_companion.sock |
| iPad (A16)                | 958F1594-1D75-44BE-8235-8277C77B165E  | Shutdown  | simulator     | iOS 18.4  | x86_64        | No Companion Connected                            |
| iPad Pro 11-inch (M4)     | 6F8FD4E7-CF73-4906-B44B-72432F0C486F  | Shutdown  | simulator     | iOS 18.4  | x86_64        | No Companion Connected                            |
| iPad Pro 13-inch (M4)     | 71DB3EA7-C5C5-40CE-B804-393A428FAD0A  | Shutdown  | simulator     | iOS 18.4  | x86_64        | No Companion Connected                            |


</details>

2. Connect to a device

<details>
<summary>Click to expand connect to a device</summary>

input:
``` bash
idb connect 00008101-001C348E2660001E

idb connect 63A0D325-6A2F-4401-9B34-ED8E7B287B07
```
output:
``` bash
udid: 00008101-001C348E2660001E is_local: True
```

</details>

3. Pick a UUID from the list and describe the device

<details>
<summary>Click to expand describe the device</summary>

Use the json argument to display the device information in a more readable format.

input:
``` bash
idb describe --udid 00008101-001C348E2660001E --json
```

<details>
<summary>Click to expand output</summary>

output:
``` json
{
    "udid": "00008101-001C348E2660001E",
    "name": "Marlon Subuy\u00fa\u2019s iPhone",
    "target_type": "device",
    "state": "Booted",
    "os_version": "iOS 18.4.1",
    "architecture": "arm64e",
    "companion_info": {
        "udid": "00008101-001C348E2660001E",
        "is_local": true,
        "pid": null,
        "address": {
            "path": "/tmp/idb/00008101-001C348E2660001E_companion.sock"
        },
        "metadata": {}
    },
    "screen_dimensions": {
        "width": 0,
        "height": 0,
        "density": 0.0,
        "width_points": 0,
        "height_points": 0
    },
    "model": null,
    "device": null,
    "extended": {
        "device": {
            "HardwarePlatform": "t8101",
            "DieID": 7939084481724446,
            "EthernetAddress": "44:f2:1b:6d:43:86",
            "PasswordProtected": false,
            "Uses24HourClock": false,
            "BootSessionID": "9F82F113-DADC-4FF3-A142-DE5B2D73AF34",
            "HumanReadableProductVersionString": "18.4.1",
            "kCTPostponementInfoServiceProvisioningState": false,
            "BluetoothAddress": "44:f2:1b:75:94:28",
            "IsPaired": true,
            "TimeZone": "America/Santo_Domingo",
            "BasebandStatus": "BBInfoAvailable",
            "BrickState": false,
            "HardwareModel": "D53gAP",
            "DeviceName": "Marlon Subuy\u00fa\u2019s iPhone",
            "SoftwareBundleVersion": "",
            "PartitionType": "GUID_partition_scheme",
            "MLBSerialNumber": "F3X04420ZXUP55CA",
            "InternationalMobileEquipmentIdentity": "351793390749401",
            "WiFiAddress": "44:f2:1b:6d:ec:19",
            "BasebandVersion": "5.51.03",
            "BasebandMasterKeyHash": "1B41607650EBF11C6B39F41CB267DC64C121A9BCF44DBA5D28F55ACC86361BBA366554CD57B4C466055803E1EF81C870",
            "WirelessBoardSerialNumber": "095B2DB00229",
            "CarrierBundleInfoArray": [],
            "TelephonyCapability": true,
            "BasebandKeyHashInformation": {
                "AKeyStatus": 2,
                "SKeyStatus": 0
            },
            "UseRaptorCerts": true,
            "CPUArchitecture": "arm64e",
            "ProductVersion": "18.4.1",
            "ActivationStateAcknowledged": true,
            "SIMStatus": "kCTSIMSupportSIMStatusNotInserted",
            "BoardId": 12,
            "RegionInfo": "LL/A",
            "com.apple.mobile.backup": {
                "CloudBackupEnabled": true,
                "Version": "2.0",
                "RequiresEncryption": 0,
                "LastCloudBackupTZ": "GMT-4",
                "LastCloudBackupDate": 769034247
            },
            "FusingStatus": 3,
            "HostAttached": true,
            "ProductionSOC": true,
            "TrustedHostAttached": true,
            "DeviceClass": "iPhone",
            "ChipID": 33025,
            "SIMTrayStatus": "kCTSIMSupportSIMTrayInsertedNoSIM",
            "HasSiDP": true,
            "BasebandChipID": 938209,
            "UniqueDeviceID": "00008101-001C348E2660001E",
            "BasebandCertId": 3095201109,
            "FirmwareVersion": "iBoot-11881.100.993",
            "TimeZoneOffsetFromUTC": -14400,
            "ModelNumber": "MGH93",
            "InternationalMobileEquipmentIdentity2": "351793390695687",
            "MobileSubscriberNetworkCode": "",
            "MobileSubscriberCountryCode": "",
            "ProductType": "iPhone13,2",
            "PairRecordProtectionClass": 4,
            "ActivationState": "Activated",
            "NonVolatileRAM": {
                "boot-args": ""
            },
            "ProtocolVersion": "2",
            "DeviceColor": "1",
            "SerialNumber": "DNTDM1W00DXT",
            "BasebandActivationTicketVersion": "V2",
            "SupportedDeviceFamilies": [
                1
            ],
            "kCTPostponementStatus": "kCTPostponementStatusActivated",
            "UniqueChipID": 7939084481724446,
            "MobileEquipmentIdentifier": "35179339074940",
            "CertID": 3095201109,
            "TimeIntervalSince1970": 1747429388.650657,
            "ProductName": "iPhone OS",
            "BuildVersion": "22E252"
        }
    },
    "diagnostics": {},
    "metadata": {}
}
```
</details>

</details>

4. Inspect the native view hierarchy

<details>
<summary>Click to expand inspect the native view hierarchy</summary>
    input:
``` bash
idb ui describe-all --udid 63A0D325-6A2F-4401-9B34-ED8E7B287B07 --json
```

<details>
<summary>Click to expand output</summary>

output:
``` json
[
    {
        "AXFrame": "{{0, 0}, {430, 932}}",
        "AXUniqueId": null,
        "frame": {
            "y": 0,
            "x": 0,
            "width": 430,
            "height": 932
        },
        "role_description": "application",
        "AXLabel": " ",
        "content_required": false,
        "type": "Application",
        "title": null,
        "help": null,
        "custom_actions": [],
        "AXValue": null,
        "enabled": true,
        "role": "AXApplication",
        "subrole": null
    },
    {
        "AXFrame": "{{31, 82}, {174, 196.66666666666669}}",
        "AXUniqueId": "Maps",
        "frame": {
            "y": 82,
            "x": 31,
            "width": 174,
            "height": 196.66666666666669
        },
        "role_description": "button",
        "AXLabel": "Maps",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": null,
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "Widget",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{225, 82}, {174, 196.66666666666669}}",
        "AXUniqueId": "Calendar",
        "frame": {
            "y": 82,
            "x": 225,
            "width": 174,
            "height": 196.66666666666669
        },
        "role_description": "button",
        "AXLabel": "Calendar",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": null,
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "Widget, Stack",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{30.666666666666686, 294}, {72, 90.666666666666686}}",
        "AXUniqueId": "Calendar",
        "frame": {
            "y": 294,
            "x": 30.666666666666686,
            "width": 72,
            "height": 90.666666666666686
        },
        "role_description": "button",
        "AXLabel": "Calendar",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "Friday, May 16",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{131.66666666666663, 294}, {68, 90.666666666666686}}",
        "AXUniqueId": "Photos",
        "frame": {
            "y": 294,
            "x": 131.66666666666663,
            "width": 68,
            "height": 90.666666666666686
        },
        "role_description": "button",
        "AXLabel": "Photos",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{223.33333333333337, 294}, {81.666666666666686, 90.666666666666686}}",
        "AXUniqueId": "Reminders",
        "frame": {
            "y": 294,
            "x": 223.33333333333337,
            "width": 81.666666666666686,
            "height": 90.666666666666686
        },
        "role_description": "button",
        "AXLabel": "Reminders",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{329, 294}, {68, 90.666666666666686}}",
        "AXUniqueId": "News",
        "frame": {
            "y": 294,
            "x": 329,
            "width": 68,
            "height": 90.666666666666686
        },
        "role_description": "button",
        "AXLabel": "News",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{33, 400}, {68, 90.666666666666686}}",
        "AXUniqueId": "Maps",
        "frame": {
            "y": 400,
            "x": 33,
            "width": 68,
            "height": 90.666666666666686
        },
        "role_description": "button",
        "AXLabel": "Maps",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{131.66666666666663, 400}, {68, 90.666666666666686}}",
        "AXUniqueId": "Health",
        "frame": {
            "y": 400,
            "x": 131.66666666666663,
            "width": 68,
            "height": 90.666666666666686
        },
        "role_description": "button",
        "AXLabel": "Health",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{230.33333333333337, 400}, {68, 90.666666666666686}}",
        "AXUniqueId": "Wallet",
        "frame": {
            "y": 400,
            "x": 230.33333333333337,
            "width": 68,
            "height": 90.666666666666686
        },
        "role_description": "button",
        "AXLabel": "Wallet",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{328.66666666666674, 400}, {68.333333333333314, 90.666666666666686}}",
        "AXUniqueId": "Settings",
        "frame": {
            "y": 400,
            "x": 328.66666666666674,
            "width": 68.333333333333314,
            "height": 90.666666666666686
        },
        "role_description": "button",
        "AXLabel": "Settings",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{176, 756.66666666666674}, {78, 30}}",
        "AXUniqueId": "spotlight-pill",
        "frame": {
            "y": 756.66666666666674,
            "x": 176,
            "width": 78,
            "height": 30
        },
        "role_description": "slider",
        "AXLabel": "Search",
        "content_required": false,
        "type": "Slider",
        "title": null,
        "help": "Activate to open Spotlight.",
        "custom_actions": [],
        "AXValue": "Page 1 of 2",
        "enabled": true,
        "role": "AXSlider",
        "subrole": null
    },
    {
        "AXFrame": "{{132, 831}, {68, 68}}",
        "AXUniqueId": "Safari",
        "frame": {
            "y": 831,
            "x": 132,
            "width": 68,
            "height": 68
        },
        "role_description": "button",
        "AXLabel": "Safari",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    },
    {
        "AXFrame": "{{230.66666666666663, 831}, {68, 68}}",
        "AXUniqueId": "Messages",
        "frame": {
            "y": 831,
            "x": 230.66666666666663,
            "width": 68,
            "height": 68
        },
        "role_description": "button",
        "AXLabel": "Messages",
        "content_required": false,
        "type": "Button",
        "title": null,
        "help": "Double tap to open",
        "custom_actions": [
            "Edit mode",
            "Today",
            "App Library"
        ],
        "AXValue": "",
        "enabled": true,
        "role": "AXButton",
        "subrole": null
    }
]
```
</details>
</details>


5. Use accessibility inspector

1. Open Xcode
2. Go to Xcode menu → Open Developer Tool → Accessibility Inspector
3. Select your target device/simulator from the dropdown at the top
4. Use the crosshair/target button (🎯) to inspect elements on the screen
5. When you hover over elements, it will show you their properties including:
    - Identifier
    - Label
    - Title
    - Value
    - And other accessibility attributes


[Inspecting native view hierarchy](https://patrol.leancode.co/tips-and-tricks#inspecting-native-view-hierarchy)