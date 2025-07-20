import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_all_favourites.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final GetAllFavouritesUseCase _getAllFavouritesUseCase;
  final FavouriteRepo _favouriteRepo;

  FavouritesCubit(this._getAllFavouritesUseCase, this._favouriteRepo)
      : super(FavouritesInitial());

  Future<void> getAllFavourites() async {
    emit(FavouritesLoading());
    final result = await _getAllFavouritesUseCase.call();
    result.fold(
      (l) => emit(FavouritesError(l)),
      (success) => emit(FavouritesLoaded(success)),
    );
  }

  Future<void> removeAllFavourites() async {
    final result = await _favouriteRepo.deleteAll();
    result.fold(
      (l) => emit(FavouritesError(l)),
      (success) => emit(FavouritesInitial()),
    );
  }
}
