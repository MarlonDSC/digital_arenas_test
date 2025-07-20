import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inmo_mobile/core/errors/bloc/message/message_bloc.dart';
import 'package:inmo_mobile/core/value_objects/priority_type.dart';
import 'package:inmo_mobile/di.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_image/breed_image_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/ui/breed_info/widgets/breed_card.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourite_info/favourite_info_cubit.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourites/favourites_cubit.dart';

class FavouriteInfoPage extends StatefulWidget {
  const FavouriteInfoPage({super.key});

  @override
  State<FavouriteInfoPage> createState() => _FavouriteInfoPageState();
}

class _FavouriteInfoPageState extends State<FavouriteInfoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouritesCubit, FavouritesState>(
      listener: _onGetAllFavourites,
      child: BlocConsumer<FavouriteInfoCubit, FavouriteInfoState>(
        listener: _onRemoveFavourite,
        builder: (context, state) {
          if (state is FavouriteInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavouriteInfoLoaded) {
            return Column(
              spacing: 16,
              children: [
                Text(
                  'Nombre del favorito: ${state.favourite.favouriteName}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                BlocProvider(
                  create: (context) =>
                      sl<BreedImageCubit>()
                         ..getBreedImage(state.breedInfo.referenceImageId!),
                  child: BreedCard(breedInfo: state.breedInfo),
                ),
                ElevatedButton.icon(
                  onPressed: () => context
                      .read<FavouriteInfoCubit>()
                      .removeFavourite(state.favourite),
                  icon: const Icon(Icons.delete),
                  label: const Text('Eliminar favorito'),
                ),
              ],
            );
          }
          if (state is FavouriteInfoError) {
            return const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _onRemoveFavourite(
    BuildContext context,
    FavouriteInfoState state,
  ) async {
    if (state is RemoveFavouriteSuccess) {
      context.read<MessageBloc>().add(
        const DisplayMessage([
          'Favorito eliminado correctamente',
        ], priority: PriorityType.low),
      );
      await context.read<FavouritesCubit>().getAllFavourites();
    }
  }

  void _onGetAllFavourites(BuildContext context, FavouritesState state) async {
    if (state is FavouritesLoaded) {
      context.pop();
    }
  }
}
