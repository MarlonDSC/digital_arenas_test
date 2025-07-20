import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_image.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_image.dart';

part 'breed_image_state.dart';

class BreedImageCubit extends Cubit<BreedImageState> {
  final GetBreedImageUseCase _getBreedImageUseCase;

  BreedImageCubit(this._getBreedImageUseCase) : super(BreedImageInitial());

  Future<void> getBreedImage(String id) async {
    emit(BreedImageLoading());
    final result = await _getBreedImageUseCase(id);
    result.fold(
      (l) => emit(BreedImageError(errors: l)),
      (r) => emit(BreedImageLoaded(breedImage: r)),
    );
  }
}
