import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/data/models/measure.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_info.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_info/breed_info_cubit.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetBreedInfoUseCase mockGetBreedInfoUseCase;
  late BreedInfoCubit breedInfoCubit;

  const testBreedId = 1;
  final testBreedInfo = BreedInfo(
    id: testBreedId,
    name: 'Golden Retriever',
    weight: Measure(imperial: '55-75 lbs', metric: '25-34 kg'),
    height: Measure(imperial: '21.5-24 inches', metric: '55-61 cm'),
    lifeSpan: '10-12 years',
    bredFor: 'Retrieving',
    breedGroup: 'Sporting',
    temperament: 'Intelligent, Friendly, Devoted',
    referenceImageId: 'golden_retriever_1',
  );

  setUp(() {
    mockGetBreedInfoUseCase = MockGetBreedInfoUseCase();
    breedInfoCubit = BreedInfoCubit(mockGetBreedInfoUseCase);
  });

  group('BreedInfoCubit', () {
    blocTest<BreedInfoCubit, BreedInfoState>(
      'Given a user selects a breed '
      'When they request breed information '
      'Then the app fetches breed info and emits success',
      setUp: () {
        provideDummy<Result<BreedInfo>>(Right(testBreedInfo));
      },
      build: () => breedInfoCubit,
      act: (bloc) => bloc.getBreedInfo(testBreedId),
      expect: () => <BreedInfoState>[
        BreedInfoLoading(),
        BreedInfoLoaded(breedInfo: testBreedInfo),
      ],
      verify: (_) {
        verify(mockGetBreedInfoUseCase(testBreedId)).called(1);
      },
    );

    blocTest<BreedInfoCubit, BreedInfoState>(
      'Given a user selects a breed '
      'When they request breed information but there is no internet connection '
      'Then the app emits failure with connection error',
      setUp: () {
        provideDummy<Result<BreedInfo>>(
          const Left([
            ErrorDetail.connection(
              'errorNoInternetConnection',
              'No internet connection',
            ),
          ]),
        );
      },
      build: () => breedInfoCubit,
      act: (bloc) => bloc.getBreedInfo(testBreedId),
      expect: () => <BreedInfoState>[
        BreedInfoLoading(),
        const   BreedInfoError(errors: [
          ErrorDetail.connection(
            'errorNoInternetConnection',
            'No internet connection',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedInfoUseCase(testBreedId)).called(1);
      },
    );

    blocTest<BreedInfoCubit, BreedInfoState>(
      'Given a user selects a breed '
      'When they request breed information but the breed is not found '
      'Then the app emits failure with not found error',
      setUp: () {
        provideDummy<Result<BreedInfo>>(
          const Left([
            ErrorDetail.unknown(
              'errorBreedNotFound',
              'Breed not found',
            ),
          ]),
        );
      },
      build: () => breedInfoCubit,
      act: (bloc) => bloc.getBreedInfo(testBreedId),
      expect: () => <BreedInfoState>[
        BreedInfoLoading(),
        const BreedInfoError(errors: [
          ErrorDetail.unknown(
            'errorBreedNotFound',
            'Breed not found',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedInfoUseCase(testBreedId)).called(1);
      },
    );

    blocTest<BreedInfoCubit, BreedInfoState>(
      'Given a user selects a breed '
      'When they request breed information but the server returns an error '
      'Then the app emits failure with server error',
      setUp: () {
        provideDummy<Result<BreedInfo>>(
          const Left([
            ErrorDetail.unknown(
              'errorServerError',
              'Internal server error',
            ),
          ]),
        );
      },
      build: () => breedInfoCubit,
      act: (bloc) => bloc.getBreedInfo(testBreedId),
      expect: () => <BreedInfoState>[
        BreedInfoLoading(),
        const BreedInfoError(errors: [
          ErrorDetail.unknown(
            'errorServerError',
            'Internal server error',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedInfoUseCase(testBreedId)).called(1);
      },
    );
  });
} 