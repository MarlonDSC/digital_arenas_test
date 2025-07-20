import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_image/breed_image_cubit.dart';

class BreedCard extends StatelessWidget {
  final BreedInfo breedInfo;
  const BreedCard({super.key, required this.breedInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(breedInfo.name, style: Theme.of(context).textTheme.titleLarge),
          BlocConsumer<BreedImageCubit, BreedImageState>(
            listener: _onGetBreedImage,
            builder: (context, state) {
              if (state is BreedImageLoaded) {
                return Image.network(
                  state.breedImage.url,
                  width: 200,
                  height: 200,
                );
              } else if (state is BreedImageError) {
                return const Icon(Icons.pets);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          ListTile(
            title: const Text('Peso'),
            subtitle: Text(
              '${breedInfo.weight.metric} kg | ${breedInfo.weight.imperial} lbs',
            ),
          ),
          ListTile(
            title: const Text('Altura'),
            subtitle: Text(
              '${breedInfo.height.metric} cm | ${breedInfo.height.imperial} in',
            ),
          ),
          if (breedInfo.lifeSpan != null)
            ListTile(
              title: const Text('Vida'),
              subtitle: Text(breedInfo.lifeSpan!),
          ),
          if (breedInfo.temperament != null)
            ListTile(
              title: const Text('Temperamento'),
              subtitle: Text(breedInfo.temperament!),
            ),
          if (breedInfo.breedGroup != null)
            ListTile(
              title: const Text('Grupo'),
              subtitle: Text(breedInfo.breedGroup!),
          ),
          if (breedInfo.bredFor != null)
            ListTile(
              title: const Text('Función'),
              subtitle: Text(breedInfo.bredFor!),
            ),
        ],
      ),
    );
  }

  void _onGetBreedImage(BuildContext context, BreedImageState state) {
    if (state is BreedImageError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al obtener la imagen')),
      );
    }
  }
}
