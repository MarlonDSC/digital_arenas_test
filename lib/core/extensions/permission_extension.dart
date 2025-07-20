import 'package:flutter/widgets.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

extension PermissionExtension on Permission {
  String toTitle(BuildContext context) {
    return switch(value) {
      0 => AppLocalizations.of(context)!.calendar,
      1 => AppLocalizations.of(context)!.camera,
      2 => AppLocalizations.of(context)!.contacts,
      3 => AppLocalizations.of(context)!.location,
      4 => AppLocalizations.of(context)!.locationAlways,
      5 => AppLocalizations.of(context)!.locationWhenInUse,
      6 => AppLocalizations.of(context)!.mediaLibrary,
      7 => AppLocalizations.of(context)!.microphone,
      8 => AppLocalizations.of(context)!.phone,
      9 => AppLocalizations.of(context)!.photos,
      10 => AppLocalizations.of(context)!.photosAddOnly,
      11 => AppLocalizations.of(context)!.reminders,
      12 => AppLocalizations.of(context)!.sensors,
      13 => AppLocalizations.of(context)!.sms,
      14 => AppLocalizations.of(context)!.speech,
      15 => AppLocalizations.of(context)!.storage,
      16 => AppLocalizations.of(context)!.ignoreBatteryOptimizations,
      17 => AppLocalizations.of(context)!.notification,
      18 => AppLocalizations.of(context)!.accessMediaLocation,
      19 => AppLocalizations.of(context)!.activityRecognition,
      20 => AppLocalizations.of(context)!.unknown,
      _ => "",
    };
  }
}