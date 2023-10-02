import 'package:first_app/fetures/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:first_app/repositories/pokemon_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'wigets/wigets.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final _pokemonListBloc = PokemonListBloc(GetIt.I<PokemonListRepository>());

  @override
  void initState() {
    _pokemonListBloc.add(LoadPokemons());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 9, 37, 66),
        title: const Text('My Pokemons'),
      ),
      body: BlocBuilder<PokemonListBloc, PokemonListState>(
          bloc: _pokemonListBloc,
          builder: (context, state) {
            if (state is PokemonListLoaded) {
              debugPrint('-----LOADED----');
              return ListView.separated(
                itemCount: state.pokemonList.length,
                itemBuilder: ((context, index) {
                  return PokemonTile(pokemon: state.pokemonList[index]);
                }),
                separatorBuilder: ((context, index) => const Divider()),
              );
            }
            return const SizedBox();
          }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          _pokemonListBloc.add(AddPokemon());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
