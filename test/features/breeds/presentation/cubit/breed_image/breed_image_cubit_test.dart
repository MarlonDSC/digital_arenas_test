import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_image.dart';
import 'package:inmo_mobile/features/breeds/domain/usecases/get_breed_image.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_image/breed_image_cubit.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetBreedImageUseCase mockGetBreedImageUseCase;
  late BreedImageCubit breedImageCubit;

  const testImageId = 'golden_retriever_1';
  final testBreedImage = BreedImage(
    id: testImageId,
    url: 'https://example.com/golden_retriever.jpg',
    width: 800,
    height: 600,
    mimeType: 'image/jpeg',
  );

  setUp(() {
    mockGetBreedImageUseCase = MockGetBreedImageUseCase();
    breedImageCubit = BreedImageCubit(mockGetBreedImageUseCase);
  });

  group('BreedImageCubit', () {
    blocTest<BreedImageCubit, BreedImageState>(
      'Given a user requests a breed image '
      'When they provide a valid image ID '
      'Then the app fetches the image and emits success',
      setUp: () {
        provideDummy<Result<BreedImage>>(Right(testBreedImage));
      },
      build: () => breedImageCubit,
      act: (bloc) => bloc.getBreedImage(testImageId),
      expect: () => <BreedImageState>[
        BreedImageLoading(),
        BreedImageLoaded(breedImage: testBreedImage),
      ],
      verify: (_) {
        verify(mockGetBreedImageUseCase(testImageId)).called(1);
      },
    );

    blocTest<BreedImageCubit, BreedImageState>(
      'Given a user requests a breed image '
      'When they provide a valid image ID but there is no internet connection '
      'Then the app emits failure with connection error',
      setUp: () {
        provideDummy<Result<BreedImage>>(
          const Left([
            ErrorDetail.connection(
              'errorNoInternetConnection',
              'No internet connection',
            ),
          ]),
        );
      },
      build: () => breedImageCubit,
      act: (bloc) => bloc.getBreedImage(testImageId),
      expect: () => <BreedImageState>[
        BreedImageLoading(),
        const BreedImageError(errors: [
          ErrorDetail.connection(
            'errorNoInternetConnection',
            'No internet connection',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedImageUseCase(testImageId)).called(1);
      },
    );

    blocTest<BreedImageCubit, BreedImageState>(
      'Given a user requests a breed image '
      'When they provide an invalid image ID '
      'Then the app emits failure with not found error',
      setUp: () {
        provideDummy<Result<BreedImage>>(
          const Left([
            ErrorDetail.unknown(
              'errorImageNotFound',
              'Image not found',
            ),
          ]),
        );
      },
      build: () => breedImageCubit,
      act: (bloc) => bloc.getBreedImage(testImageId),
      expect: () => <BreedImageState>[
        BreedImageLoading(),
        const BreedImageError(errors: [
          ErrorDetail.unknown(
            'errorImageNotFound',
            'Image not found',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedImageUseCase(testImageId)).called(1);
      },
    );

    blocTest<BreedImageCubit, BreedImageState>(
      'Given a user requests a breed image '
      'When they provide a valid image ID but the server returns an error '
      'Then the app emits failure with server error',
      setUp: () {
        provideDummy<Result<BreedImage>>(
          const Left([
            ErrorDetail.unknown(
              'errorServerError',
              'Internal server error',
            ),
          ]),
        );
      },
      build: () => breedImageCubit,
      act: (bloc) => bloc.getBreedImage(testImageId),
      expect: () => <BreedImageState>[
        BreedImageLoading(),
        const BreedImageError(errors: [
          ErrorDetail.unknown(
            'errorServerError',
            'Internal server error',
          ),
        ]),
      ],
      verify: (_) {
        verify(mockGetBreedImageUseCase(testImageId)).called(1);
      },
    );
  });
} 