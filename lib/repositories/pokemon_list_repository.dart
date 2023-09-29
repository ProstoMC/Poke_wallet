import 'package:dio/dio.dart';
import 'package:first_app/models/pokemon_model.dart';
import 'dart:math';

import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class PokemonListRepository {
  //var pokemonList = <Pokemon>[];

  Future<List<Pokemon>> fetchPokemonList() async {
    var pokemonList = <Pokemon>[];

    for (int index = 0; index < 5; index++) {
      final id = Random().nextInt(150) + 1;

      final pokemon = await fetchPokemon(id);

      pokemonList.add(pokemon);
    }

    return pokemonList;
  }

  Future<Pokemon> fetchPokemon(int id) async {
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$id/');
    final data = response.data as Map<String, dynamic>;
    var name = data["name"] as String;
    name = name.capitalize();
    debugPrint(name);

    //GETTING IMAGE URL FROM MAPS

    final sprites = data["sprites"] as Map<String, dynamic>;
    final other = sprites['other'] as Map<String, dynamic>;
    final dreamWorld = other['dream_world'] as Map<String, dynamic>;

    final imageURL = dreamWorld['front_default'];

    return Pokemon(name: name, imageURL: imageURL);
  }
}
