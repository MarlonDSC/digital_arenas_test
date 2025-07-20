import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/favourite/domain/repo/favourite_repo.dart';
import 'package:inmo_mobile/features/favourite/domain/usecases/remove_favourite.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late FavouriteRepo mockFavouriteRepo;
  late RemoveFavouriteUseCase removeFavouriteUseCase;

  setUp(() {
    mockFavouriteRepo = MockFavouriteRepo();
    removeFavouriteUseCase = RemoveFavouriteUseCase(mockFavouriteRepo);
  });

  test('returns Right(Unit) when remove favourite succeeds', () async {
    // Arrange
    const favouriteId = 1;
    Result<Unit> response = const Right(unit);
    provideDummy<Result<Unit>>(response);
    when(
      mockFavouriteRepo.removeFavourite(favouriteId),
    ).thenAnswer((_) async => response);

    // Act
    final result = await removeFavouriteUseCase(favouriteId);

    // Expect
    expect(result.isRight(), isTrue);
    verify(mockFavouriteRepo.removeFavourite(favouriteId)).called(1);
  });

  test('returns Left([ErrorDetail]) when remove favourite fails', () async {
    // Arrange
    const favouriteId = 1;
    final error = ErrorDetail.server(
      'removeFavouriteError',
      'Error removing favourite',
      Exception('fail'),
      StackTrace.current,
    );
    Result<Unit> response = Left([error]);
    provideDummy<Result<Unit>>(response);
    when(
      mockFavouriteRepo.removeFavourite(favouriteId),
    ).thenAnswer((_) async => response);

    // Act
    final result = await removeFavouriteUseCase(favouriteId);

    // Assert
    expect(result.isLeft(), isTrue);
    result.fold((l) {
      expect(l.first.code, equals(error.code));
    }, (r) => fail('Expected Left but got Right'));
    verify(mockFavouriteRepo.removeFavourite(favouriteId)).called(1);
  });
} 