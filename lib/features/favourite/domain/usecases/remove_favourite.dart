import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';

class RemoveFavouriteUseCase {
  final FavouriteRepo _favouriteRepo;

  RemoveFavouriteUseCase(this._favouriteRepo);

  Future<Result<Unit>> call(int id) async {
    return _favouriteRepo.removeFavourite(id);
  }
}