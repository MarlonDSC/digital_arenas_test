import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:inmo_mobile/core/constants/api.dart';
import 'package:inmo_mobile/features/breeds/data/ds/breed_ds.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/data/models/measure.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late BreedDs breedDs;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: kApiUrl));
    dioAdapter = DioAdapter(dio: dio);
    breedDs = BreedDs(dio);
  });

  group('BreedDs', () {
    group('getBreeds', () {
      test('returns list of breeds on successful response', () async {
        // Arrange
        final expectedResponse = [
          {
            'id': 1,
            'name': 'Golden Retriever',
          },
          {
            'id': 2,
            'name': 'Labrador Retriever',
          },
          {
            'id': 3,
            'name': 'German Shepherd',
          },
        ];

        dioAdapter.onGet(
          '/breeds',
          (server) => server.reply(
            200,
            expectedResponse,
          ),
          queryParameters: {},
        );

        // Act
        final result = await breedDs.getBreeds();

        // Assert
        expect(result.data, isA<List<Breed>>());
        expect(result.data.length, equals(3));
        expect(result.data[0].id, equals(1));
        expect(result.data[0].name, equals('Golden Retriever'));
        expect(result.data[1].id, equals(2));
        expect(result.data[1].name, equals('Labrador Retriever'));
        expect(result.data[2].id, equals(3));
        expect(result.data[2].name, equals('German Shepherd'));
      });

      test('returns empty list when no breeds available', () async {
        // Arrange
        final expectedResponse = <Map<String, dynamic>>[];

        dioAdapter.onGet(
          '/breeds',
          (server) => server.reply(
            200,
            expectedResponse,
          ),
          queryParameters: {},
        );

        // Act
        final result = await breedDs.getBreeds();

        // Assert
        expect(result.data, isA<List<Breed>>());
        expect(result.data.isEmpty, isTrue);
      });

      test('throws DioException on network error', () async {
        // Arrange
        dioAdapter.onGet(
          '/breeds',
          (server) => server.throws(
            500,
            DioException(
              requestOptions: RequestOptions(path: '/breeds'),
              error: 'Server Error',
            ),
          ),
          queryParameters: {},
        );

        // Act & Assert
        expect(
          () => breedDs.getBreeds(),
          throwsA(isA<DioException>()),
        );
      });

      test('throws DioException on 404 error', () async {
        // Arrange
        dioAdapter.onGet(
          '/breeds',
          (server) => server.throws(
            404,
            DioException(
              requestOptions: RequestOptions(path: '/breeds'),
              error: 'Not Found',
            ),
          ),
          queryParameters: {},
        );

        // Act & Assert
        expect(
          () => breedDs.getBreeds(),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('getBreedInfo', () {
      test('returns breed info on successful response', () async {
        // Arrange
        const breedId = 1;
        final expectedResponse = {
          'id': breedId,
          'name': 'Golden Retriever',
          'weight': {
            'imperial': '55 - 75',
            'metric': '25 - 34',
          },
          'height': {
            'imperial': '21.5 - 24',
            'metric': '55 - 61',
          },
          'life_span': '10 - 12 years',
          'bred_for': 'Retrieving game for hunters',
          'breed_group': 'Sporting',
          'temperament': 'Intelligent, Kind, Reliable, Friendly, Trustworthy, Confident',
          'reference_image_id': 'golden-retriever-1',
        };

        dioAdapter.onGet(
          '/breeds/$breedId',
          (server) => server.reply(
            200,
            expectedResponse,
          ),
          queryParameters: {},
        );

        // Act
        final result = await breedDs.getBreedInfo(breedId);

        // Assert
        expect(result.data, isA<BreedInfo>());
        expect(result.data.id, equals(breedId));
        expect(result.data.name, equals('Golden Retriever'));
        expect(result.data.weight, isA<Measure>());
        expect(result.data.weight.imperial, equals('55 - 75'));
        expect(result.data.weight.metric, equals('25 - 34'));
        expect(result.data.height, isA<Measure>());
        expect(result.data.height.imperial, equals('21.5 - 24'));
        expect(result.data.height.metric, equals('55 - 61'));
        expect(result.data.lifeSpan, equals('10 - 12 years'));
        expect(result.data.bredFor, equals('Retrieving game for hunters'));
        expect(result.data.breedGroup, equals('Sporting'));
        expect(result.data.temperament, equals('Intelligent, Kind, Reliable, Friendly, Trustworthy, Confident'));
        expect(result.data.referenceImageId, equals('golden-retriever-1'));
      });

      test('returns breed info with null optional fields', () async {
        // Arrange
        const breedId = 2;
        final expectedResponse = {
          'id': breedId,
          'name': 'Mixed Breed',
          'weight': {
            'imperial': '20 - 60',
            'metric': '9 - 27',
          },
          'height': {
            'imperial': '12 - 24',
            'metric': '30 - 61',
          },
          'life_span': null,
          'bred_for': null,
          'breed_group': null,
          'temperament': null,
          'reference_image_id': 'mixed-breed-1',
        };

        dioAdapter.onGet(
          '/breeds/$breedId',
          (server) => server.reply(
            200,
            expectedResponse,
          ),
          queryParameters: {},
        );

        // Act
        final result = await breedDs.getBreedInfo(breedId);

        // Assert
        expect(result.data, isA<BreedInfo>());
        expect(result.data.id, equals(breedId));
        expect(result.data.name, equals('Mixed Breed'));
        expect(result.data.lifeSpan, isNull);
        expect(result.data.bredFor, isNull);
        expect(result.data.breedGroup, isNull);
        expect(result.data.temperament, isNull);
        expect(result.data.referenceImageId, equals('mixed-breed-1'));
      });

      test('throws DioException on breed not found', () async {
        // Arrange
        const breedId = 999;

        dioAdapter.onGet(
          '/breeds/$breedId',
          (server) => server.throws(
            404,
            DioException(
              requestOptions: RequestOptions(path: '/breeds/$breedId'),
              error: 'Breed not found',
            ),
          ),
          queryParameters: {},
        );

        // Act & Assert
        expect(
          () => breedDs.getBreedInfo(breedId),
          throwsA(isA<DioException>()),
        );
      });

      test('throws DioException on server error', () async {
        // Arrange
        const breedId = 1;

        dioAdapter.onGet(
          '/breeds/$breedId',
          (server) => server.throws(
            500,
            DioException(
              requestOptions: RequestOptions(path: '/breeds/$breedId'),
              error: 'Internal Server Error',
            ),
          ),
          queryParameters: {},
        );

        // Act & Assert
        expect(
          () => breedDs.getBreedInfo(breedId),
          throwsA(isA<DioException>()),
        );
      });
    });
  });
}