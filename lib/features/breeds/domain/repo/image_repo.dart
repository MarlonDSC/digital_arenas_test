import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/features/breeds/data/ds/image_ds.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_image.dart';
import 'package:inmo_mobile/core/repo/base_repo.dart';

abstract class ImageRepo {
  Future<Result<BreedImage>> getBreedImage(String id);
}

class ImageRepoImpl extends BaseRepo implements ImageRepo {
  final ImageDs _imageDs;

  ImageRepoImpl(this._imageDs);

  @override
  Future<Result<BreedImage>> getBreedImage(String id) async {
    return executeApiCall<BreedImage>(
      apiCall: () => _imageDs.getBreedImage(id),
    );
  }
}
