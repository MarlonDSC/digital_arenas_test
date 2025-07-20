import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:inmo_mobile/core/constants/api.dart';
import 'package:inmo_mobile/features/breeds/data/ds/image_ds.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_image.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ImageDs imageDs;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kApiUrl));
    dioAdapter = DioAdapter(dio: dio);
    imageDs = ImageDs(dio);
  });

  group('ImageDs', () {
    group('getBreedImage', () {
      test('returns breed image on successful response', () async {
        // Arrange
        const imageId = 'golden-retriever-1';
        final expectedResponse = {
          'id': imageId,
          'url': 'https://cdn2.thedogapi.com/images/golden-retriever-1.jpg',
          'width': 1200,
          'height': 800,
          'mime_type': 'image/jpeg',
        };

        dioAdapter.onGet(
          '/images/$imageId',
          (server) => server.reply(
            200,
            expectedResponse,
          ),
          queryParameters: {},
        );

        // Act
        final result = await imageDs.getBreedImage(imageId);

        // Assert
        expect(result.data, isA<BreedImage>());
        expect(result.data.id, equals(imageId));
        expect(result.data.url, equals('https://cdn2.thedogapi.com/images/golden-retriever-1.jpg'));
        expect(result.data.width, equals(1200));
        expect(result.data.height, equals(800));
        expect(result.data.mimeType, equals('image/jpeg'));
      });

      test('returns breed image with null mime type', () async {
        // Arrange
        const imageId = 'labrador-1';
        final expectedResponse = {
          'id': imageId,
          'url': 'https://cdn2.thedogapi.com/images/labrador-1.jpg',
          'width': 1024,
          'height': 768,
          'mime_type': null,
        };

        dioAdapter.onGet(
          '/images/$imageId',
          (server) => server.reply(
            200,
            expectedResponse,
          ),
          queryParameters: {},
        );

        // Act
        final result = await imageDs.getBreedImage(imageId);

        // Assert
        expect(result.data, isA<BreedImage>());
        expect(result.data.id, equals(imageId));
        expect(result.data.url, equals('https://cdn2.thedogapi.com/images/labrador-1.jpg'));
        expect(result.data.width, equals(1024));
        expect(result.data.height, equals(768));
        expect(result.data.mimeType, isNull);
      });

      test('returns breed image with different image formats', () async {
        // Arrange
        const imageId = 'german-shepherd-1';
        final expectedResponse = {
          'id': imageId,
          'url': 'https://cdn2.thedogapi.com/images/german-shepherd-1.png',
          'width': 1920,
          'height': 1080,
          'mime_type': 'image/png',
        };

        dioAdapter.onGet(
          '/images/$imageId',
          (server) => server.reply(
            200,
            expectedResponse,
          ),
          queryParameters: {},
        );

        // Act
        final result = await imageDs.getBreedImage(imageId);

        // Assert
        expect(result.data, isA<BreedImage>());
        expect(result.data.id, equals(imageId));
        expect(result.data.url, equals('https://cdn2.thedogapi.com/images/german-shepherd-1.png'));
        expect(result.data.width, equals(1920));
        expect(result.data.height, equals(1080));
        expect(result.data.mimeType, equals('image/png'));
      });

      test('throws DioException on image not found', () async {
        // Arrange
        const imageId = 'non-existent-image';

        dioAdapter.onGet(
          '/images/$imageId',
          (server) => server.throws(
            404,
            DioException(
              requestOptions: RequestOptions(path: '/images/$imageId'),
              error: 'Image not found',
            ),
          ),
          queryParameters: {},
        );

        // Act & Assert
        expect(
          () => imageDs.getBreedImage(imageId),
          throwsA(isA<DioException>()),
        );
      });

      test('throws DioException on server error', () async {
        // Arrange
        const imageId = 'test-image';

        dioAdapter.onGet(
          '/images/$imageId',
          (server) => server.throws(
            500,
            DioException(
              requestOptions: RequestOptions(path: '/images/$imageId'),
              error: 'Internal Server Error',
            ),
          ),
          queryParameters: {},
        );

        // Act & Assert
        expect(
          () => imageDs.getBreedImage(imageId),
          throwsA(isA<DioException>()),
        );
      });

      test('throws DioException on network timeout', () async {
        // Arrange
        const imageId = 'slow-image';

        dioAdapter.onGet(
          '/images/$imageId',
          (server) => server.throws(
            408,
            DioException(
              requestOptions: RequestOptions(path: '/images/$imageId'),
              error: 'Request Timeout',
            ),
          ),
          queryParameters: {},
        );

        // Act & Assert
        expect(
          () => imageDs.getBreedImage(imageId),
          throwsA(isA<DioException>()),
        );
      });

      test('throws DioException on unauthorized access', () async {
        // Arrange
        const imageId = 'private-image';

        dioAdapter.onGet(
          '/images/$imageId',
          (server) => server.throws(
            401,
            DioException(
              requestOptions: RequestOptions(path: '/images/$imageId'),
              error: 'Unauthorized',
            ),
          ),
          queryParameters: {},
        );

        // Act & Assert
        expect(
          () => imageDs.getBreedImage(imageId),
          throwsA(isA<DioException>()),
        );
      });
    });
  });
}