import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/data/models/measure.dart';
import 'package:inmo_mobile/features/breeds/domain/repo/breed_repo.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_info.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late BreedRepo mockBreedRepo;
  late GetBreedInfoUseCase getBreedInfoUseCase;

  setUp(() {
    mockBreedRepo = MockBreedRepo();
    getBreedInfoUseCase = GetBreedInfoUseCase(mockBreedRepo);
  });

  test('returns Right(BreedInfo) when get breed info succeeds', () async {
    // Arrange
    const breedId = 1;
    final breedInfo = BreedInfo(
      id: breedId,
      name: 'Golden Retriever',
      weight: Measure(imperial: '55-75 lbs', metric: '25-34 kg'),
      height: Measure(imperial: '21.5-24 inches', metric: '55-61 cm'),
      lifeSpan: '10-12 years',
      bredFor: 'Retrieving',
      breedGroup: 'Sporting',
      temperament: 'Friendly, Intelligent, Devoted',
      referenceImageId: 'img123',
    );
    Result<BreedInfo> response = Right(breedInfo);
    provideDummy<Result<BreedInfo>>(response);
    when(
      mockBreedRepo.getBreedInfo(breedId),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getBreedInfoUseCase(breedId);

    // Expect
    expect(result.isRight(), isTrue);
    result.fold((l) => fail('Expected Right but got Left'), (r) {
      expect(r, equals(breedInfo));
      expect(r.id, equals(breedId));
      expect(r.name, equals('Golden Retriever'));
    });
    verify(mockBreedRepo.getBreedInfo(breedId)).called(1);
  });

  test('returns Left([ErrorDetail]) when get breed info fails', () async {
    // Arrange
    const breedId = 1;
    final error = ErrorDetail.server(
      'getBreedInfoError',
      'Error fetching breed info',
      Exception('fail'),
      StackTrace.current,
    );
    Result<BreedInfo> response = Left([error]);
    provideDummy<Result<BreedInfo>>(response);
    when(
      mockBreedRepo.getBreedInfo(breedId),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getBreedInfoUseCase(breedId);

    // Assert
    expect(result.isLeft(), isTrue);
    result.fold((l) {
      expect(l.first.code, equals(error.code));
    }, (r) => fail('Expected Left but got Right'));
    verify(mockBreedRepo.getBreedInfo(breedId)).called(1);
  });
} 