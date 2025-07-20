part of 'breed_image_cubit.dart';

sealed class BreedImageState extends Equatable {
  const BreedImageState();

  @override
  List<Object> get props => [];
}

final class BreedImageInitial extends BreedImageState {}

final class BreedImageLoading extends BreedImageState {}

final class BreedImageLoaded extends BreedImageState {
  final BreedImage breedImage;

  const BreedImageLoaded({required this.breedImage});
}

final class BreedImageError extends BreedImageState {
  final List<BaseError> errors;

  const BreedImageError({required this.errors});
}