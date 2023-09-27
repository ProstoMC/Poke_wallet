import 'package:flutter/material.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  var pokemonName = 'Poke Details';
  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments == null || arguments is! String) {
      return;
    }

    pokemonName = arguments;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonName),
      ),
    );
  }
}
