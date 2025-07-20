import 'package:inmo_mobile/features/breeds/domain/repo/breed_repo.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/core/constants/result.dart';

class GetBreedInfoUseCase {
  final BreedRepo _breedRepo;

  GetBreedInfoUseCase(this._breedRepo);

  Future<Result<BreedInfo>> call(int id) async {
    return _breedRepo.getBreedInfo(id);
  }
}