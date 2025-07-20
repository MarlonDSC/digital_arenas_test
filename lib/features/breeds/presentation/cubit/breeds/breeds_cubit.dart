import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breeds.dart';

part 'breeds_state.dart';

class BreedsCubit extends Cubit<BreedsState> {
  final GetBreedsUseCase _getBreedsUseCase;

  BreedsCubit(this._getBreedsUseCase) : super(BreedsInitial());

  Future<void> getBreeds() async {
    emit(BreedsLoading());
    final result = await _getBreedsUseCase();
    result.fold(
      (l) => emit(BreedsError(errors: l)),
      (r) => emit(BreedsLoaded(breeds: r)),
    );
  }
}
