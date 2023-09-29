import 'package:first_app/models/pokemon_model.dart';
import 'package:first_app/repositories/pokemon_list_repository.dart';
import 'package:flutter/material.dart';
import 'wigets/wigets.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  //final String title;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  List<Pokemon> _pokemonList = [];

  @override
  void initState() {
    fetchPokemons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('My Pokemons'),
      ),
      body: (_pokemonList.isEmpty)
          ? const SizedBox()
          : ListView.separated(
              itemCount: _pokemonList.length,
              itemBuilder: ((context, index) {
                var pokemon = _pokemonList[index];
                return PokemonTile(pokemon: pokemon);
              }),
              separatorBuilder: ((context, index) => const Divider()),
            ),
    );
  }

  fetchPokemons() async {
    _pokemonList = await PokemonListRepository().fetchPokemonList();
    setState(() {});
  }
}
