import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourites/favourites_cubit.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is FavouritesLoaded) {
          if (state.favourites.isEmpty) {
            return const Center(child: Text('No hay favoritos'));
          }
          return ListView.builder(
            itemCount: state.favourites.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.favourites[index].favouriteName),
                leading: const Icon(Icons.pets),
                onTap: () => context.push(
                  '${RoutePath.favourites}/${state.favourites[index].id}',
                ),
              );
            },
          );
        }
        if (state is FavouritesError) {
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
