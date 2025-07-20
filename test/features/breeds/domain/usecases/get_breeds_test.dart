import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';
import 'package:inmo_mobile/features/breeds/domain/repo/breed_repo.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breeds.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late BreedRepo mockBreedRepo;
  late GetBreedsUseCase getBreedsUseCase;

  setUp(() {
    mockBreedRepo = MockBreedRepo();
    getBreedsUseCase = GetBreedsUseCase(mockBreedRepo);
  });

  test('returns Right(List<Breed>) when get breeds succeeds', () async {
    // Arrange
    final breeds = [
      Breed(id: 1, name: 'Golden Retriever'),
      Breed(id: 2, name: 'Labrador'),
    ];
    Result<List<Breed>> response = Right(breeds);
    provideDummy<Result<List<Breed>>>(response);
    when(
      mockBreedRepo.getBreeds(),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getBreedsUseCase();

    // Expect
    expect(result.isRight(), isTrue);
    result.fold((l) => fail('Expected Right but got Left'), (r) {
      expect(r, equals(breeds));
      expect(r.length, equals(2));
    });
    verify(mockBreedRepo.getBreeds()).called(1);
  });

  test('returns Left([ErrorDetail]) when get breeds fails', () async {
    // Arrange
    final error = ErrorDetail.server(
      'getBreedsError',
      'Error fetching breeds',
      Exception('fail'),
      StackTrace.current,
    );
    Result<List<Breed>> response = Left([error]);
    provideDummy<Result<List<Breed>>>(response);
    when(
      mockBreedRepo.getBreeds(),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getBreedsUseCase();

    // Assert
    expect(result.isLeft(), isTrue);
    result.fold((l) {
      expect(l.first.code, equals(error.code));
    }, (r) => fail('Expected Left but got Right'));
    verify(mockBreedRepo.getBreeds()).called(1);
  });
} 