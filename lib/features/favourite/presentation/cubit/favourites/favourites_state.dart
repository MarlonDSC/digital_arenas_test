part of 'favourites_cubit.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesLoading extends FavouritesState {}

final class FavouritesLoaded extends FavouritesState {
  final List<Favourite> favourites;

  const FavouritesLoaded(this.favourites);
}

final class FavouritesError extends FavouritesState {
  final List<BaseError> errors;

  const FavouritesError(this.errors);
}
