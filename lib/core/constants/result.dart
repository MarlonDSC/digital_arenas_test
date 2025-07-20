import 'package:flutter/material.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/extensions/app_localization_extension.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';
part 'package:inmo_mobile/core/extensions/result_extension.dart';

typedef Result<T> = Either<List<BaseError>, T>;