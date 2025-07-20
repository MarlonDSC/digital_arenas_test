part of 'package:inmo_mobile/core/constants/result.dart';

extension ResultExtension<T> on Result<T> {
  bool get isSuccess => isRight();
  bool get isFailure => isLeft();

  List<BaseError> get errors => getLeft().toNullable() ?? [];

  Result<R> mapValue<R>(R Function(T right) f) {
    return map(f);
  }

  Result<R> andThen<R>(Result<R> Function(T left) f) {
    return andThen(f);
  }

  String? validate(BuildContext context) {
    return fold(
      (l) =>
          l.map((e) => AppLocalizations.of(context)?.error(e, context)).join('\n'),
      (r) => null,
    );
  }
}
