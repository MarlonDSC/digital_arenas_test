import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breeds/breeds_cubit.dart';

class BreedsPage extends StatefulWidget {
  const BreedsPage({super.key});

  @override
  State<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreedsCubit, BreedsState>(
      builder: (context, state) {
        if (state is BreedsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is BreedsLoaded) {
          return ListView.builder(
            itemCount: state.breeds.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.breeds[index].name),
                onTap: () {
                  context.push(
                    '${RoutePath.breeds}/${state.breeds[index].id}',
                  );
                },
              );
            },
          );
        }
        if (state is BreedsError) {
          return Center(child: Text(state.errors.toString()));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
