import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          const pokemonName = 'Pokemon';
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/pokeball.svg',
              height: 40,
              width: 40,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white60,
            ),
            title: Text(
              pokemonName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              'Subtitle',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/pokemon_details', arguments: pokemonName);
            },
          );
        }),
        separatorBuilder: ((context, index) => const Divider()),
      ),
    );
  }
}