import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/get_all_favourites.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late FavouriteRepo mockFavouriteRepo;
  late GetAllFavouritesUseCase getAllFavouritesUseCase;

  setUp(() {
    mockFavouriteRepo = MockFavouriteRepo();
    getAllFavouritesUseCase = GetAllFavouritesUseCase(mockFavouriteRepo);
  });

  test('returns Right(List<Favourite>) when get all favourites succeeds', () async {
    // Arrange
    final favourites = [
      Favourite(
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
      ),
      Favourite(
        id: 2,
        favouriteName: 'My Labrador',
        breedId: 2,
        breedName: 'Labrador',
        breedImageId: 'img456',
        breedImperialWeight: '55-80 lbs',
        breedMetricWeight: '25-36 kg',
        breedImperialHeight: '21.5-24.5 inches',
        breedMetricHeight: '55-62 cm',
        breedLifeSpan: '10-14 years',
        breedBredFor: 'Retrieving',
        breedBreedGroup: 'Sporting',
        breedTemperament: 'Active, Intelligent, Friendly',
      ),
    ];
    Result<List<Favourite>> response = Right(favourites);
    provideDummy<Result<List<Favourite>>>(response);
    when(
      mockFavouriteRepo.getAllFavourites(),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getAllFavouritesUseCase();

    // Expect
    expect(result.isRight(), isTrue);
    result.fold((l) => fail('Expected Right but got Left'), (r) {
      expect(r, equals(favourites));
      expect(r.length, equals(2));
      expect(r.first.breedName, equals('Golden Retriever'));
      expect(r.last.breedName, equals('Labrador'));
    });
    verify(mockFavouriteRepo.getAllFavourites()).called(1);
  });

  test('returns Left([ErrorDetail]) when get all favourites fails', () async {
    // Arrange
    final error = ErrorDetail.server(
      'getAllFavouritesError',
      'Error fetching favourites',
      Exception('fail'),
      StackTrace.current,
    );
    Result<List<Favourite>> response = Left([error]);
    provideDummy<Result<List<Favourite>>>(response);
    when(
      mockFavouriteRepo.getAllFavourites(),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getAllFavouritesUseCase();

    // Assert
    expect(result.isLeft(), isTrue);
    result.fold((l) {
      expect(l.first.code, equals(error.code));
    }, (r) => fail('Expected Left but got Right'));
    verify(mockFavouriteRepo.getAllFavourites()).called(1);
  });
} 