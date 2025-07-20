import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_favourite.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late FavouriteRepo mockFavouriteRepo;
  late GetFavouriteUseCase getFavouriteUseCase;

  setUp(() {
    mockFavouriteRepo = MockFavouriteRepo();
    getFavouriteUseCase = GetFavouriteUseCase(mockFavouriteRepo);
  });

  test('returns Right(Favourite) when get favourite succeeds', () async {
    // Arrange
    const favouriteId = 1;
    final favourite = Favourite(
      id: favouriteId,
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
    Result<Favourite> response = Right(favourite);
    provideDummy<Result<Favourite>>(response);
    when(
      mockFavouriteRepo.getFavourite(favouriteId),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getFavouriteUseCase(favouriteId);

    // Expect
    expect(result.isRight(), isTrue);
    result.fold((l) => fail('Expected Right but got Left'), (r) {
      expect(r, equals(favourite));
      expect(r.id, equals(favouriteId));
      expect(r.breedName, equals('Golden Retriever'));
    });
    verify(mockFavouriteRepo.getFavourite(favouriteId)).called(1);
  });

  test('returns Left([ErrorDetail]) when get favourite fails', () async {
    // Arrange
    const favouriteId = 1;
    final error = ErrorDetail.server(
      'getFavouriteError',
      'Error fetching favourite',
      Exception('fail'),
      StackTrace.current,
    );
    Result<Favourite> response = Left([error]);
    provideDummy<Result<Favourite>>(response);
    when(
      mockFavouriteRepo.getFavourite(favouriteId),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getFavouriteUseCase(favouriteId);

    // Assert
    expect(result.isLeft(), isTrue);
    result.fold((l) {
      expect(l.first.code, equals(error.code));
    }, (r) => fail('Expected Left but got Right'));
    verify(mockFavouriteRepo.getFavourite(favouriteId)).called(1);
  });
} 