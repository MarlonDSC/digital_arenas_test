import 'dart:async';

import 'package:inmo_mobile/di.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_image.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_info.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breeds.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/add_favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_all_favourites.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/remove_favourite.dart';
import 'test_helper.mocks.dart';

Future<void> setupDiHelper(String initialRoute) async {
  await sl.reset();
  setupLocator('test', initialRoute);
  sl.registerLazySingleton<GetBreedsUseCase>(() => MockGetBreedsUseCase());
  sl.registerLazySingleton<GetBreedInfoUseCase>(
    () => MockGetBreedInfoUseCase(),
  );
  sl.registerLazySingleton<GetBreedImageUseCase>(
    () => MockGetBreedImageUseCase(),
  );
  sl.registerLazySingleton<AddFavouriteUseCase>(
    () => MockAddFavouriteUseCase(),
  );
  sl.registerLazySingleton<RemoveFavouriteUseCase>(
    () => MockRemoveFavouriteUseCase(),
  );
  sl.registerLazySingleton<GetFavouriteUseCase>(
    () => MockGetFavouriteUseCase(),
  );
  sl.registerLazySingleton<GetAllFavouritesUseCase>(
    () => MockGetAllFavouritesUseCase(),
  );
  // sl.registerLazySingleton<RequestPermissionUseCase>(() => MockRequestPermissionUseCase());
}
