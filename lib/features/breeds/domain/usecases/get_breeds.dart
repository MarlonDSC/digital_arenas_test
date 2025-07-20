import 'package:inmo_mobile/features/breeds/domain/repo/breed_repo.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';
import 'package:inmo_mobile/core/constants/result.dart';

class GetBreedsUseCase {
  final BreedRepo _breedRepo;

  GetBreedsUseCase(this._breedRepo);

  Future<Result<List<Breed>>> call() async {
    return await _breedRepo.getBreeds();
  }
}
