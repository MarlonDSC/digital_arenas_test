import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/add_favourite.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late FavouriteRepo mockFavouriteRepo;
  late AddFavouriteUseCase addFavouriteUseCase;
  late Favourite favourite;

  setUp(() {
    mockFavouriteRepo = MockFavouriteRepo();
    addFavouriteUseCase = AddFavouriteUseCase(mockFavouriteRepo);
    favourite = Favourite(
      id: 1,
      favouriteName: 'My Golden Retriever',
      breedId: 1,
      breedName: 'Golden Retriever',
      breedImageId: 'img123',
      breedImperialWeight: '55-75 lbs',
      breedMetricWeight: '25-34 kg',
      breedImperialHeight: '21.5-24 inches',
      breedMetricHeight: '55-61 cm',
      breedLifeSpan: '10-12 years',
      breedBredFor: 'Retrieving',
      breedBreedGroup: 'Sporting',
      breedTemperament: 'Friendly, Intelligent, Devoted',
    );
  });

  test('returns Right(Unit) when add favourite succeeds', () async {
    // Arrange
    Result<Unit> response = const Right(unit);
    provideDummy<Result<Unit>>(response);
    when(
      mockFavouriteRepo.addFavourite(favourite),
    ).thenAnswer((_) async => response);

    // Act
    final result = await addFavouriteUseCase(favourite);

    // Expect
    expect(result.isRight(), isTrue);
    verify(mockFavouriteRepo.addFavourite(favourite)).called(1);
  });

  test('returns Left([ErrorDetail]) when add favourite fails', () async {
    // Arrange
    final error = ErrorDetail.server(
      'addFavouriteError',
      'Error adding favourite',
      Exception('fail'),
      StackTrace.current,
    );
    Result<Unit> response = Left([error]);
    provideDummy<Result<Unit>>(response);
    when(
      mockFavouriteRepo.addFavourite(favourite),
    ).thenAnswer((_) async => response);

    // Act
    final result = await addFavouriteUseCase(favourite);

    // Assert
    expect(result.isLeft(), isTrue);
    result.fold((l) {
      expect(l.first.code, equals(error.code));
    }, (r) => fail('Expected Left but got Right'));
    verify(mockFavouriteRepo.addFavourite(favourite)).called(1);
  });
} 