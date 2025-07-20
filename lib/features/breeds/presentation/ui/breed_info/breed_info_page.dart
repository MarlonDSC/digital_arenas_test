import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/modal/modal_bloc.dart';
import 'package:inmo_mobile/di.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_image/breed_image_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_info/breed_info_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/ui/breed_info/widgets/breed_card.dart';
import 'package:inmo_mobile/features/breeds/presentation/ui/breed_info/widgets/favourite_breed_sheet.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourite_info/favourite_info_cubit.dart';

class BreedInfoPage extends StatefulWidget {
  final int id;
  const BreedInfoPage({super.key, required this.id});

  @override
  State<BreedInfoPage> createState() => _BreedInfoPageState();
}

class _BreedInfoPageState extends State<BreedInfoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreedInfoCubit, BreedInfoState>(
      listener: _onGetBreedInfo,
      builder: (context, state) {
        return BlocBuilder<BreedInfoCubit, BreedInfoState>(
          builder: (context, state) {
            if (state is BreedInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BreedInfoLoaded) {
              return Column(
                children: [
                  BreedCard(breedInfo: state.breedInfo),
                  ElevatedButton.icon(
                    onPressed: () {
                      _showBottomSheet(context, state.breedInfo);
                    },
                    icon: const Icon(Icons.favorite),
                    label: const Text('Añadir a favoritos'),
                  ),
                ],
              );
            } else if (state is BreedInfoError) {
              return ElevatedButton(
                onPressed: () {
                  context.read<BreedInfoCubit>().getBreedInfo(widget.id);
                },
                child: const Text('Try again'),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  void _onGetBreedInfo(BuildContext context, BreedInfoState state) {
    if (state is BreedInfoError) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.errors.toString())));
    } else if (state is BreedInfoLoaded) {
      context.read<BreedImageCubit>().getBreedImage(
        state.breedInfo.referenceImageId,
      );
    }
  }

  void _showBottomSheet(BuildContext context, BreedInfo breedInfo) {
    context.read<ModalBloc>().add(
      DisplayModal(
        BlocProvider(
          create: (context) => sl<FavouriteInfoCubit>(),
          child: FavouriteBreedSheet(
            breedInfo: breedInfo,
          ),
        ),
      ),
    );
  }
}
