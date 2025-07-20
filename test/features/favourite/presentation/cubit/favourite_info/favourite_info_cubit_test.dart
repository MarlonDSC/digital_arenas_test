import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/data/models/measure.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/add_favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/remove_favourite.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourite_info/favourite_info_cubit.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late AddFavouriteUseCase mockAddFavouriteUseCase;
  late RemoveFavouriteUseCase mockRemoveFavouriteUseCase;
  late GetFavouriteUseCase mockGetFavouriteUseCase;
  late FavouriteInfoCubit favouriteInfoCubit;

  final testBreedInfo = BreedInfo(
    id: 1,
    name: 'Golden Retriever',
    weight: Measure(imperial: '55-75 lbs', metric: '25-34 kg'),
    height: Measure(imperial: '21.5-24 inches', metric: '55-61 cm'),
    lifeSpan: '10-12 years',
    bredFor: 'Retrieving',
    breedGroup: 'Sporting',
    temperament: 'Intelligent, Friendly, Devoted',
    referenceImageId: 'golden_retriever_1',
  );

  final testFavourite = Favourite(
    id: 0, // Default ID when created from BreedInfo
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

  const testFavouriteName = 'My Golden';
  const testFavouriteId = 1;

  setUp(() {
    mockAddFavouriteUseCase = MockAddFavouriteUseCase();
    mockRemoveFavouriteUseCase = MockRemoveFavouriteUseCase();
    mockGetFavouriteUseCase = MockGetFavouriteUseCase();
    favouriteInfoCubit = FavouriteInfoCubit(
      mockAddFavouriteUseCase,
      mockRemoveFavouriteUseCase,
      mockGetFavouriteUseCase,
    );
  });

  group('FavouriteInfoCubit', () {
    blocTest<FavouriteInfoCubit, FavouriteInfoState>(
      'Given a user wants to add a breed to favourites '
      'When they provide a valid breed info and name '
      'Then the app adds the favourite and emits success',
      setUp: () {
        provideDummy<Result<Unit>>(const Right(unit));
      },
      build: () => favouriteInfoCubit,
      act: (bloc) => bloc.addFavourite(testBreedInfo, testFavouriteName),
      expect: () => <FavouriteInfoState>[
         FavouriteInfoLoading(),
        AddFavouriteSuccess(testFavourite),
      ],
      verify: (_) {
        verify(mockAddFavouriteUseCase.call(testFavourite)).called(1);
      },
    );

    blocTest<FavouriteInfoCubit, FavouriteInfoState>(
      'Given a user wants to add a breed to favourites '
      'When they provide a valid breed info and name but the database returns an error '
      'Then the app emits failure with database error',
      setUp: () {
        provideDummy<Result<Unit>>(
          const Left([
            ErrorDetail.db(
              'errorAddFavouriteFailed',
              'Failed to add favourite',
            ),
          ]),
        );
      },
      build: () => favouriteInfoCubit,
      act: (bloc) => bloc.addFavourite(testBreedInfo, testFavouriteName),
      expect: () => <FavouriteInfoState>[
        FavouriteInfoLoading(),
        const FavouriteInfoError([
          ErrorDetail.db(
            'errorAddFavouriteFailed',
            'Failed to add favourite',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockAddFavouriteUseCase.call(testFavourite)).called(1);
      },
    );

    blocTest<FavouriteInfoCubit, FavouriteInfoState>(
      'Given a user wants to get favourite information '
      'When they provide a valid favourite ID '
      'Then the app fetches the favourite and emits success',
      setUp: () {
        // Create a favourite with the expected ID for retrieval
        final retrievedFavourite = Favourite(
          id: testFavouriteId, // This should be the ID from the database
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
        provideDummy<Result<Favourite>>(Right(retrievedFavourite));
      },
      build: () => favouriteInfoCubit,
      act: (bloc) => bloc.getFavourite(testFavouriteId),
              expect: () => <FavouriteInfoState>[
          FavouriteInfoLoading(),
          FavouriteInfoLoaded(Favourite(
          id: testFavouriteId,
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
        )),
      ],
      verify: (_) {
        verify(mockGetFavouriteUseCase.call(testFavouriteId)).called(1);
      },
    );

    blocTest<FavouriteInfoCubit, FavouriteInfoState>(
      'Given a user wants to get favourite information '
      'When they provide a valid favourite ID but the favourite is not found '
      'Then the app emits failure with not found error',
      setUp: () {
        provideDummy<Result<Favourite>>(
          const Left([
            ErrorDetail.unknown(
              'errorFavouriteNotFound',
              'Favourite not found',
            ),
          ]),
        );
      },
      build: () => favouriteInfoCubit,
      act: (bloc) => bloc.getFavourite(testFavouriteId),
      expect: () => <FavouriteInfoState>[
        FavouriteInfoLoading(),
        const FavouriteInfoError([
          ErrorDetail.unknown(
            'errorFavouriteNotFound',
            'Favourite not found',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetFavouriteUseCase.call(testFavouriteId)).called(1);
      },
    );

    blocTest<FavouriteInfoCubit, FavouriteInfoState>(
      'Given a user wants to get favourite information '
      'When they provide a valid favourite ID but the database returns an error '
      'Then the app emits failure with database error',
      setUp: () {
        provideDummy<Result<Favourite>>(
          const Left([
            ErrorDetail.db(
              'errorDatabaseError',
              'Database error',
            ),
          ]),
        );
      },
      build: () => favouriteInfoCubit,
      act: (bloc) => bloc.getFavourite(testFavouriteId),
      expect: () => <FavouriteInfoState>[
        FavouriteInfoLoading(),
        const FavouriteInfoError([
          ErrorDetail.db(
            'errorDatabaseError',
            'Database error',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetFavouriteUseCase.call(testFavouriteId)).called(1);
      },
    );
  });
} 