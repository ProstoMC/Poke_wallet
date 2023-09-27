import 'package:flutter/material.dart';
import 'wigets/wigets.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  //final String title;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('My Pokemons'),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: ((context, index) {
          var pokemonName = 'Pokemon $index';
          return PokemonTile(pokemonName: pokemonName);
        }),
        separatorBuilder: ((context, index) => const Divider()),
      ),
    );
  }
}
