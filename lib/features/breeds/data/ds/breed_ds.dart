import 'package:dio/dio.dart';
import 'package:inmo_mobile/core/constants/api.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:retrofit/retrofit.dart';

part 'breed_ds.g.dart';

@RestApi(baseUrl: kApiUrl)
abstract class BreedDs {
  factory BreedDs(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _BreedDs;

  @GET('/breeds')
  Future<HttpResponse<List<Breed>>> getBreeds();

  @GET('/breeds/{id}')
  Future<HttpResponse<BreedInfo>> getBreedInfo(@Path('id') int id);
}
