import 'package:first_app/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.network(
        pokemon.imageURL,
        height: 40,
        width: 40,
      ),
      // trailing: const Icon(
      //   Icons.arrow_forward_ios,
      //   color: Colors.white60,
      // ),
      title: Text(
        pokemon.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      // subtitle: Text(
      //   'Subtitle',
      //   style: Theme.of(context).textTheme.bodySmall,
      // ),
      onTap: () {
        Navigator.of(context)
            .pushNamed('/pokemon_details', arguments: pokemon.name);
      },
    );
  }
}
