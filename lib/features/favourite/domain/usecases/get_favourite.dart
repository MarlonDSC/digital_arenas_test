import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';

class GetFavouriteUseCase {
  final FavouriteRepo _favouriteRepo;

  GetFavouriteUseCase(this._favouriteRepo);

  Future<Result<Favourite>> call(int id) async {
    return _favouriteRepo.getFavourite(id);
  }
}