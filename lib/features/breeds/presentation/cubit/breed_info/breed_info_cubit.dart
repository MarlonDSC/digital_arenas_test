import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_info.dart';

part 'breed_info_state.dart';

class BreedInfoCubit extends Cubit<BreedInfoState> {
  final GetBreedInfoUseCase _getBreedInfoUseCase;

  BreedInfoCubit(this._getBreedInfoUseCase) : super(BreedInfoInitial());

  Future<void> getBreedInfo(int id) async {
    emit(BreedInfoLoading());
    final result = await _getBreedInfoUseCase(id);
    result.fold(
      (l) => emit(BreedInfoError(errors: l)),
      (r) => emit(BreedInfoLoaded(breedInfo: r)),
    );
  }
}
