import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breeds.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breeds/breeds_cubit.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetBreedsUseCase mockGetBreedsUseCase;
  late BreedsCubit breedsCubit;

  final testBreed1 = Breed(id: 1, name: 'Golden Retriever');
  final testBreed2 = Breed(id: 2, name: 'Labrador Retriever');
  final testBreed3 = Breed(id: 3, name: 'German Shepherd');

  setUp(() {
    mockGetBreedsUseCase = MockGetBreedsUseCase();
    breedsCubit = BreedsCubit(mockGetBreedsUseCase);
  });

  group('BreedsCubit', () {
    final testBreeds = [testBreed1, testBreed2, testBreed3];

    blocTest<BreedsCubit, BreedsState>(
      'Given the app loads the breeds screen '
      'When the user requests to get breeds '
      'Then the app fetches breeds and emits success',
      setUp: () {
        provideDummy<Result<List<Breed>>>(Right(testBreeds));
      },
      build: () => breedsCubit,
      act: (bloc) => bloc.getBreeds(),
      expect: () => <BreedsState>[
        BreedsLoading(),
        BreedsLoaded(breeds: testBreeds),
      ],
      verify: (_) {
        verify(mockGetBreedsUseCase()).called(1);
      },
    );

    blocTest<BreedsCubit, BreedsState>(
      'Given the app loads the breeds screen '
      'When the user requests to get breeds but there is no internet connection '
      'Then the app emits failure with connection error',
      setUp: () {
        provideDummy<Result<List<Breed>>>(
          const Left([
            ErrorDetail.connection(
              'errorNoInternetConnection',
              'No internet connection',
            ),
          ]),
        );
      },
      build: () => breedsCubit,
      act: (bloc) => bloc.getBreeds(),
      expect: () => <BreedsState>[
        BreedsLoading(),
        const BreedsError(errors: [
          ErrorDetail.connection(
            'errorNoInternetConnection',
            'No internet connection',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedsUseCase()).called(1);
      },
    );

    blocTest<BreedsCubit, BreedsState>(
      'Given the app loads the breeds screen '
      'When the user requests to get breeds but the server returns an error '
      'Then the app emits failure with server error',
      setUp: () {
        provideDummy<Result<List<Breed>>>(
          const Left([
            ErrorDetail.unknown(
              'errorServerError',
              'Internal server error',
            ),
          ]),
        );
      },
      build: () => breedsCubit,
      act: (bloc) => bloc.getBreeds(),
      expect: () => <BreedsState>[
        BreedsLoading(),
        const BreedsError(errors: [
          ErrorDetail.unknown(
            'errorServerError',
            'Internal server error',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedsUseCase()).called(1);
      },
    );

    blocTest<BreedsCubit, BreedsState>(
      'Given the app loads the breeds screen '
      'When the user requests to get breeds but the API is unavailable '
      'Then the app emits failure with API error',
      setUp: () {
        provideDummy<Result<List<Breed>>>(
          const Left([
            ErrorDetail.unknown(
              'errorApiUnavailable',
              'API service unavailable',
            ),
          ]),
        );
      },
      build: () => breedsCubit,
      act: (bloc) => bloc.getBreeds(),
      expect: () => <BreedsState>[
        BreedsLoading(),
        const BreedsError(errors: [
          ErrorDetail.unknown(
            'errorApiUnavailable',
            'API service unavailable',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedsUseCase()).called(1);
      },
    );
  });
} 