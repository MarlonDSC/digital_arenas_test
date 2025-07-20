import 'package:go_router/go_router.dart';
import 'package:inmo_mobile/core/errors/bloc/message/message_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/modal/modal_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/timer/timer_bloc.dart';
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
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  // Ds
  MockSpec<BreedDs>(),
  MockSpec<ImageDs>(),
  // Repos
  MockSpec<BreedRepo>(),
  MockSpec<ImageRepo>(),
  MockSpec<FavouriteRepo>(),
  // UseCases
  MockSpec<GetBreedsUseCase>(),
  MockSpec<GetBreedInfoUseCase>(),
  MockSpec<GetBreedImageUseCase>(),
  MockSpec<AddFavouriteUseCase>(),
  MockSpec<RemoveFavouriteUseCase>(),
  MockSpec<GetFavouriteUseCase>(),
  MockSpec<GetAllFavouritesUseCase>(),
  // Blocs
  MockSpec<MessageBloc>(),
  MockSpec<ModalBloc>(),
  MockSpec<TimerBloc>(),
  MockSpec<BreedsCubit>(),
  MockSpec<BreedInfoCubit>(),
  MockSpec<BreedImageCubit>(),
  MockSpec<FavouritesCubit>(),
  MockSpec<FavouriteInfoCubit>(),
  // Router
  MockSpec<GoRouter>(),
])
void main() {}
