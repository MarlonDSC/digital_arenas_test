import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inmo_mobile/core/errors/bloc/message/message_bloc.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/core/value_objects/priority_type.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourite_info/favourite_info_cubit.dart';

class FavouriteBreedSheet extends StatefulWidget {
  final BreedInfo breedInfo;
  const FavouriteBreedSheet({super.key, required this.breedInfo});

  @override
  State<FavouriteBreedSheet> createState() => _FavouriteBreedSheetState();
}

class _FavouriteBreedSheetState extends State<FavouriteBreedSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteInfoCubit, FavouriteInfoState>(
      listener: _onAddFavourite,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Asigna un nombre a tu favorito'),
            leading: const SizedBox.shrink(),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Nombre'),
                    autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre es requerido';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await context.read<FavouriteInfoCubit>().addFavourite(
                            widget.breedInfo,
                            _nameController.text,
                          );
                        }
                      },
                      child: const Text('Guardar'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onAddFavourite(BuildContext context, FavouriteInfoState state) {
    if (state is AddFavouriteSuccess) {
      context.read<MessageBloc>().add(
        DisplayMessage(
          ['Favorito agregado correctamente'],
          priority: PriorityType.low,
          action: MapEntry(
            'Ver todos',
            () => context.push(RoutePath.favourites),
          ),
        ),
      );
    }
  }
}
