import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:objectbox/objectbox.dart';

abstract class FavouriteRepo {
  Future<Result<Unit>> addFavourite(Favourite favourite);
  Future<Result<Unit>> removeFavourite(int id);
  Future<Result<Favourite>> getFavourite(int id);
  Future<Result<List<Favourite>>> getAllFavourites();
  Future<Result<Unit>> deleteAll();
}

class FavouriteRepoImpl implements FavouriteRepo {
  final Store _store;

  FavouriteRepoImpl({required Store store}) : _store = store;

  @override
  Future<Result<Unit>> addFavourite(Favourite favourite) async {
    try {
      final box = _store.box<Favourite>();
      box.put(favourite);
      return right(unit);
    } catch (e) {
      return left([
        const ErrorDetail.db('addFavourite', 'Error al agregar el favorito'),
      ]);
    }
  }

  @override
  Future<Result<Unit>> removeFavourite(int id) async {
    try {
      final box = _store.box<Favourite>();
      box.remove(id);
      return right(unit);
    } catch (e) {
      return left([
        const ErrorDetail.db('removeFavourite', 'Error al eliminar el favorito'),
      ]);
    }
  }

  @override
  Future<Result<Favourite>> getFavourite(int id) async {
    try {
      final box = _store.box<Favourite>();
      final favourite = box.get(id);
      if (favourite == null) {
        return left([
          const ErrorDetail.db('getFavourite', 'Favorito no encontrado'),
        ]);
      }
      return right(favourite);
    } catch (e) {
      return left([
        const ErrorDetail.db('getFavourite', 'Error al obtener el favorito'),
      ]);
    }
  }

  @override
  Future<Result<List<Favourite>>> getAllFavourites() async {
    try {
      final box = _store.box<Favourite>();
      return right(box.getAll());
    } catch (e) {
      return left([
        const ErrorDetail.db('getAllFavourites', 'Error al obtener los favoritos'),
      ]);
    }
  }

  @override
  Future<Result<Unit>> deleteAll() async {
    try {
      final box = _store.box<Favourite>();
      box.removeAll();
      return right(unit);
    } catch (e) {
      return left([
        const ErrorDetail.db('deleteAll', 'Error al eliminar todos los favoritos'),
      ]);
    }
  }
}
