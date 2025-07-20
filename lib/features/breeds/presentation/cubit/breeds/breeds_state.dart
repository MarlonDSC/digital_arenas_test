part of 'breeds_cubit.dart';

sealed class BreedsState extends Equatable {
  const BreedsState();

  @override
  List<Object> get props => [];
}

final class BreedsInitial extends BreedsState {}

final class BreedsLoading extends BreedsState {}

final class BreedsLoaded extends BreedsState {
  final List<Breed> breeds;

  const BreedsLoaded({required this.breeds});

  @override
  List<Object> get props => [breeds];
}

final class BreedsError extends BreedsState {
  final List<BaseError> errors;

  const BreedsError({required this.errors});

  @override
  List<Object> get props => [errors];
}
