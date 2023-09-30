import 'package:first_app/models/pokemon_model.dart';
import 'package:flutter/material.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return PokemonTileWidget(pokemon: pokemon);
  }
}

class PokemonTileWidget extends StatelessWidget {
  const PokemonTileWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: pokemon.imageSVG,
      ),
      title: Text(
        pokemon.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      // subtitle: Text(
      //   'Subtitle',
      //   style: Theme.of(context).textTheme.bodySmall,
      // ),
      onTap: () {
        Navigator.of(context).pushNamed('/pokemon_details', arguments: pokemon);
      },
    );
  }
}
