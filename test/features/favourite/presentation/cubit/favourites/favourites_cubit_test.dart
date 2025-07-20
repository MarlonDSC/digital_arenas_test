import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_all_favourites.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourites/favourites_cubit.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetAllFavouritesUseCase mockGetAllFavouritesUseCase;
  late FavouriteRepo mockFavouriteRepo;
  late FavouritesCubit favouritesCubit;

  final testFavourite1 = Favourite(
    favouriteName: 'My Golden',
    breedId: 1,
    breedName: 'Golden Retriever',
    breedImperialWeight: '55-75 lbs',
    breedMetricWeight: '25-34 kg',
    breedImperialHeight: '21.5-24 inches',
    breedMetricHeight: '55-61 cm',
    breedLifeSpan: '10-12 years',
    breedBredFor: 'Retrieving',
    breedBreedGroup: 'Sporting',
    breedTemperament: 'Intelligent, Friendly, Devoted',
    breedImageId: 'golden_retriever_1',
  );

  final testFavourite2 = Favourite(
    favouriteName: 'My Labrador',
    breedId: 2,
    breedName: 'Labrador Retriever',
    breedImperialWeight: '55-80 lbs',
    breedMetricWeight: '25-36 kg',
    breedImperialHeight: '21.5-24.5 inches',
    breedMetricHeight: '55-62 cm',
    breedLifeSpan: '10-12 years',
    breedBredFor: 'Retrieving',
    breedBreedGroup: 'Sporting',
    breedTemperament: 'Intelligent, Friendly, Active',
    breedImageId: 'labrador_retriever_1',
  );

  setUp(() {
    mockGetAllFavouritesUseCase = MockGetAllFavouritesUseCase();
    mockFavouriteRepo = MockFavouriteRepo();
    favouritesCubit = FavouritesCubit(mockGetAllFavouritesUseCase, mockFavouriteRepo);
  });

  group('FavouritesCubit', () {
    final testFavourites = [testFavourite1, testFavourite2];

    blocTest<FavouritesCubit, FavouritesState>(
      'Given the app loads the favourites screen '
      'When the user requests to get all favourites '
      'Then the app fetches favourites and emits success',
      setUp: () {
        provideDummy<Result<List<Favourite>>>(Right(testFavourites));
      },
      build: () => favouritesCubit,
      act: (bloc) => bloc.getAllFavourites(),
      expect: () => <FavouritesState>[
        FavouritesLoading(),
        FavouritesLoaded(testFavourites),
      ],
      verify: (_) {
        verify(mockGetAllFavouritesUseCase.call()).called(1);
      },
    );

    blocTest<FavouritesCubit, FavouritesState>(
      'Given the app loads the favourites screen '
      'When the user requests to get all favourites but there is no internet connection '
      'Then the app emits failure with connection error',
      setUp: () {
        provideDummy<Result<List<Favourite>>>(
          const Left([
            ErrorDetail.connection(
              'errorNoInternetConnection',
              'No internet connection',
            ),
          ]),
        );
      },
      build: () => favouritesCubit,
      act: (bloc) => bloc.getAllFavourites(),
      expect: () => <FavouritesState>[
        FavouritesLoading(),
        const FavouritesError([
          ErrorDetail.connection(
            'errorNoInternetConnection',
            'No internet connection',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetAllFavouritesUseCase.call()).called(1);
      },
    );

    blocTest<FavouritesCubit, FavouritesState>(
      'Given the app loads the favourites screen '
      'When the user requests to get all favourites but the database returns an error '
      'Then the app emits failure with database error',
      setUp: () {
        provideDummy<Result<List<Favourite>>>(
          const Left([
            ErrorDetail.db(
              'errorDatabaseError',
              'Database error',
            ),
          ]),
        );
      },
      build: () => favouritesCubit,
      act: (bloc) => bloc.getAllFavourites(),
      expect: () => <FavouritesState>[
        FavouritesLoading(),
        const FavouritesError([
          ErrorDetail.db(
            'errorDatabaseError',
            'Database error',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetAllFavouritesUseCase.call()).called(1);
      },
    );

    blocTest<FavouritesCubit, FavouritesState>(
      'Given the user has favourites '
      'When they request to remove all favourites '
      'Then the app removes all favourites and emits initial state',
      setUp: () {
        provideDummy<Result<Unit>>(const Right(unit));
      },
      build: () => favouritesCubit,
      act: (bloc) => bloc.removeAllFavourites(),
      expect: () => <FavouritesState>[
        FavouritesInitial(),
      ],
      verify: (_) {
        verify(mockFavouriteRepo.deleteAll()).called(1);
      },
    );

    blocTest<FavouritesCubit, FavouritesState>(
      'Given the user has favourites '
      'When they request to remove all favourites but the database returns an error '
      'Then the app emits failure with database error',
      setUp: () {
        provideDummy<Result<Unit>>(
          const Left([
            ErrorDetail.db(
              'errorDeleteFailed',
              'Failed to delete favourites',
            ),
          ]),
        );
      },
      build: () => favouritesCubit,
      act: (bloc) => bloc.removeAllFavourites(),
      expect: () => <FavouritesState>[
        const FavouritesError([
          ErrorDetail.db(
            'errorDeleteFailed',
            'Failed to delete favourites',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockFavouriteRepo.deleteAll()).called(1);
      },
    );
  });
} 