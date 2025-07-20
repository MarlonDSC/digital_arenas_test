import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/add_favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/remove_favourite.dart';

part 'favourite_info_state.dart';

class FavouriteInfoCubit extends Cubit<FavouriteInfoState> {
  final AddFavouriteUseCase _addFavouriteUseCase;
  final RemoveFavouriteUseCase _removeFavouriteUseCase;
  final GetFavouriteUseCase _getFavouriteUseCase;

  FavouriteInfoCubit(
    this._addFavouriteUseCase,
    this._removeFavouriteUseCase,
    this._getFavouriteUseCase,
  ) : super(FavouriteInfoInitial());

  Future<void> addFavourite(BreedInfo breedInfo, String name) async {
    emit(FavouriteInfoLoading());
    var favourite = Favourite.fromBreedInfo(name, breedInfo);
    final result = await _addFavouriteUseCase.call(favourite);
    result.fold(
      (l) => emit(FavouriteInfoError(l)),
      (r) => emit(AddFavouriteSuccess(favourite)),
    );
  }

  Future<void> removeFavourite(Favourite favourite) async {
    emit(FavouriteInfoLoading());
    final result = await _removeFavouriteUseCase.call(favourite.id);
    result.fold(
      (l) => emit(FavouriteInfoError(l)),
      (r) => emit(RemoveFavouriteSuccess(favourite)),
    );
  }

  Future<void> getFavourite(int id) async {
    emit(FavouriteInfoLoading());
    final result = await _getFavouriteUseCase.call(id);
    result.fold(
      (l) => emit(FavouriteInfoError(l)),
      (r) => emit(FavouriteInfoLoaded(r)),
    );
  }
}
