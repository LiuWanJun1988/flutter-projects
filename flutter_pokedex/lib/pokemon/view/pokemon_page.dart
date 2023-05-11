import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pokemon.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage._();

  static Route<String> route(){
    return MaterialPageRoute(builder: (_) => const PokemonPage._());
  }

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => context.read<PokemonCubit>().addFavourite(),
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<PokemonCubit, PokemonState>(
          listener: (context, state) {
            if(state.status.isSuccess){
              context.read<PokemonCubit>().refreshPokemon();
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case PokemonStatus.initial:
                return const Text('Empty');
              case PokemonStatus.loading:
                return const CircularProgressIndicator();
              case PokemonStatus.success:
                return PokemonPopulated(
                    id: state.pokemon.id!,
                    name: state.pokemon.name!,
                    image: state.pokemon.image!
                );
              case PokemonStatus.failure:
                return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}