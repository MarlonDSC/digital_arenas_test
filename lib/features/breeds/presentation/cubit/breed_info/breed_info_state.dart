part of 'breed_info_cubit.dart';

sealed class BreedInfoState extends Equatable {
  const BreedInfoState();

  @override
  List<Object> get props => [];
}

final class BreedInfoInitial extends BreedInfoState {}

final class BreedInfoLoading extends BreedInfoState {}

final class BreedInfoLoaded extends BreedInfoState {
  final BreedInfo breedInfo;

  const BreedInfoLoaded({required this.breedInfo});

  @override
  List<Object> get props => [breedInfo];
}

final class BreedInfoError extends BreedInfoState {
  final List<BaseError> errors;

  const BreedInfoError({required this.errors});

  @override
  List<Object> get props => [errors];
}
