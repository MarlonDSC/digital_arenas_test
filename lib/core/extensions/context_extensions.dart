import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/core/errors/bloc/message/message_bloc.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';
import 'package:inmo_mobile/core/extensions/app_localization_extension.dart';
import 'package:inmo_mobile/core/value_objects/priority_type.dart';

extension ContextExtensions on BuildContext {
  /// Displays a list of error messages using the MessageBloc
  void displayErrors(
    List<BaseError> errors, {
    Color? color,
    MapEntry<String, void Function()>? action,
    PriorityType priority = PriorityType.low,
  }) {
    read<MessageBloc>().add(
      DisplayMessage(
        errors.map((e) => AppLocalizations.of(this)!.error(e, this)).toList(),
        color: color,
        action: action,
        priority: priority,
      ),
    );
  }

  /// Displays a success message using the MessageBloc
  void displayMessage(
    String message, {
    Color? color,
    MapEntry<String, void Function()>? action,
    PriorityType priority = PriorityType.low,
  }) {
    read<MessageBloc>().add(
      DisplayMessage(
        [message],
        color: color,
        action: action,
        priority: priority,
      ),
    );
  }
}
