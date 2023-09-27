import 'package:first_app/fetures/pokemon_details/pokemon_details_screen.dart';
import 'package:first_app/fetures/pokemon_list/pokemon_list_screen.dart';

final router = {
  '/': (context) => const PokemonList(),
  '/pokemon_details': (context) => const PokemonDetails(),
};
