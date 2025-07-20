import 'package:dio/dio.dart';
import 'package:inmo_mobile/core/constants/api.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_image.dart';
import 'package:retrofit/retrofit.dart';

part 'image_ds.g.dart';

@RestApi(baseUrl: kApiUrl)
abstract class ImageDs {
  factory ImageDs(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _ImageDs;

  @GET('/images/{id}')
  Future<HttpResponse<BreedImage>> getBreedImage(@Path('id') String id);
}
