import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/features/breeds/data/ds/breed_ds.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/core/repo/base_repo.dart';

abstract class BreedRepo {
  Future<Result<List<Breed>>> getBreeds();
  Future<Result<BreedInfo>> getBreedInfo(int id);
}

class BreedRepoImpl extends BaseRepo implements BreedRepo {
  final BreedDs _breedDs;

  BreedRepoImpl(this._breedDs);

  @override
  Future<Result<List<Breed>>> getBreeds() async {
    return executeApiCall<List<Breed>>(
      apiCall: () => _breedDs.getBreeds(),
    );
  }

  @override
  Future<Result<BreedInfo>> getBreedInfo(int id) async {
    return executeApiCall<BreedInfo>(
      apiCall: () => _breedDs.getBreedInfo(id),
    );
  }
}
