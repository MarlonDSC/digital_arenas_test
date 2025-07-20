import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_image.dart';
import 'package:inmo_mobile/features/breeds/domain/repo/image_repo.dart';

class GetBreedImageUseCase {
  final ImageRepo _imageRepo;

  GetBreedImageUseCase(this._imageRepo);

  Future<Result<BreedImage>> call(String id) async {
    return await _imageRepo.getBreedImage(id);
  }
}