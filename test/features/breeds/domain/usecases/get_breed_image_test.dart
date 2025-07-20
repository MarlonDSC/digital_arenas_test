import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_image.dart';
import 'package:inmo_mobile/features/breeds/domain/repo/image_repo.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_image.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late ImageRepo mockImageRepo;
  late GetBreedImageUseCase getBreedImageUseCase;

  setUp(() {
    mockImageRepo = MockImageRepo();
    getBreedImageUseCase = GetBreedImageUseCase(mockImageRepo);
  });

  test('returns Right(BreedImage) when get breed image succeeds', () async {
    // Arrange
    const imageId = 'img123';
    final breedImage = BreedImage(
      id: imageId,
      url: 'https://example.com/image.jpg',
      width: 800,
      height: 600,
      mimeType: 'image/jpeg',
    );
    Result<BreedImage> response = Right(breedImage);
    provideDummy<Result<BreedImage>>(response);
    when(
      mockImageRepo.getBreedImage(imageId),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getBreedImageUseCase(imageId);

    // Expect
    expect(result.isRight(), isTrue);
    result.fold((l) => fail('Expected Right but got Left'), (r) {
      expect(r, equals(breedImage));
      expect(r.id, equals(imageId));
      expect(r.url, equals('https://example.com/image.jpg'));
    });
    verify(mockImageRepo.getBreedImage(imageId)).called(1);
  });

  test('returns Left([ErrorDetail]) when get breed image fails', () async {
    // Arrange
    const imageId = 'img123';
    final error = ErrorDetail.server(
      'getBreedImageError',
      'Error fetching breed image',
      Exception('fail'),
      StackTrace.current,
    );
    Result<BreedImage> response = Left([error]);
    provideDummy<Result<BreedImage>>(response);
    when(
      mockImageRepo.getBreedImage(imageId),
    ).thenAnswer((_) async => response);

    // Act
    final result = await getBreedImageUseCase(imageId);

    // Assert
    expect(result.isLeft(), isTrue);
    result.fold((l) {
      expect(l.first.code, equals(error.code));
    }, (r) => fail('Expected Left but got Right'));
    verify(mockImageRepo.getBreedImage(imageId)).called(1);
  });
} 