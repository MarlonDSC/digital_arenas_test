import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';

class GetAllFavouritesUseCase {
  final FavouriteRepo _favouriteRepo;

  GetAllFavouritesUseCase(this._favouriteRepo);

  Future<Result<List<Favourite>>> call() async {
    return _favouriteRepo.getAllFavourites();
  }
}
