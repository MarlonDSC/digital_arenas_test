import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:inmo_mobile/core/constants/api.dart';
import 'package:inmo_mobile/core/errors/bloc/message/message_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/modal/modal_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/timer/timer_bloc.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/core/utils/key_interceptor.dart';
import 'package:inmo_mobile/core/utils/object_box.dart';
import 'package:inmo_mobile/features/breeds/data/ds/breed_ds.dart';
import 'package:inmo_mobile/features/breeds/data/ds/image_ds.dart';
import 'package:inmo_mobile/features/breeds/domain/repo/breed_repo.dart';
import 'package:inmo_mobile/features/breeds/domain/repo/image_repo.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_image.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_info.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breeds.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_image/breed_image_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_info/breed_info_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breeds/breeds_cubit.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/add_favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_all_favourites.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/remove_favourite.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourite_info/favourite_info_cubit.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourites/favourites_cubit.dart';

final sl = GetIt.instance;

void setupLocator(String environment, String initialRoute) async {
  if (environment == 'prod') {
    sl.registerSingleton(const FlutterSecureStorage());
    var dio = Dio(BaseOptions(baseUrl: kApiUrl));
    dio.interceptors.add(KeyInterceptor(kApiKey));

    var objectBox = await ObjectBox.create();

    // Ds
    sl.registerSingleton<BreedDs>(BreedDs(dio));
    sl.registerSingleton<ImageDs>(ImageDs(dio));
    // Repos
    sl.registerSingleton<BreedRepo>(BreedRepoImpl(sl<BreedDs>()));
    sl.registerSingleton<ImageRepo>(ImageRepoImpl(sl<ImageDs>()));
    sl.registerSingleton<FavouriteRepo>(
      FavouriteRepoImpl(store: objectBox.store),
    );
    // UseCases
    sl.registerSingleton<GetBreedsUseCase>(GetBreedsUseCase(sl<BreedRepo>()));
    sl.registerSingleton<GetBreedInfoUseCase>(
      GetBreedInfoUseCase(sl<BreedRepo>()),
    );
    sl.registerSingleton<GetBreedImageUseCase>(
      GetBreedImageUseCase(sl<ImageRepo>()),
    );
    sl.registerSingleton<AddFavouriteUseCase>(
      AddFavouriteUseCase(sl<FavouriteRepo>()),
    );
    sl.registerSingleton<RemoveFavouriteUseCase>(
      RemoveFavouriteUseCase(sl<FavouriteRepo>()),
    );
    sl.registerSingleton<GetFavouriteUseCase>(
      GetFavouriteUseCase(sl<FavouriteRepo>()),
    );
    sl.registerSingleton<GetAllFavouritesUseCase>(
      GetAllFavouritesUseCase(sl<FavouriteRepo>()),
    );
  }

  // Blocs
  sl.registerFactory<MessageBloc>(() => MessageBloc());
  sl.registerFactory<ModalBloc>(() => ModalBloc());
  sl.registerFactory<TimerBloc>(() => TimerBloc());
  sl.registerFactory<BreedsCubit>(() => BreedsCubit(sl()));
  sl.registerFactory<BreedInfoCubit>(() => BreedInfoCubit(sl()));
  sl.registerFactory<BreedImageCubit>(() => BreedImageCubit(sl()));
  sl.registerFactory<FavouritesCubit>(() => FavouritesCubit(sl(), sl()));
  sl.registerFactory<FavouriteInfoCubit>(() => FavouriteInfoCubit(sl(), sl(), sl()));
  // Router
  sl.registerSingleton<ConfigRouter>(
    ConfigRouter(initialLocation: initialRoute),
  );
}
