part of 'favourite_info_cubit.dart';

sealed class FavouriteInfoState extends Equatable {
  const FavouriteInfoState();

  @override
  List<Object> get props => [];
}

final class FavouriteInfoInitial extends FavouriteInfoState {}

final class FavouriteInfoLoading extends FavouriteInfoState {}

final class FavouriteInfoLoaded extends FavouriteInfoState {
  final Favourite favourite;

  const FavouriteInfoLoaded(this.favourite);

  BreedInfo get breedInfo => BreedInfo.fromFavourite(favourite);

  @override
  List<Object> get props => [favourite];
}

final class AddFavouriteSuccess extends FavouriteInfoLoaded {
  const AddFavouriteSuccess(super.favourite);
}

final class RemoveFavouriteSuccess extends FavouriteInfoLoaded {
  const RemoveFavouriteSuccess(super.favourite);
}

final class FavouriteInfoError extends FavouriteInfoState {
  final List<BaseError> errors;

  const FavouriteInfoError(this.errors);

  @override
  List<Object> get props => [errors];
}
