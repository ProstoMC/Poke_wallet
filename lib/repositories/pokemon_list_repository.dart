import 'package:dio/dio.dart';
import 'package:first_app/models/pokemon_model.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

abstract class AbstractPokemonListRepository {
  Future<List<Pokemon>> fetchPokemonList();
}

class PokemonListRepository implements AbstractPokemonListRepository {
  @override
  Future<List<Pokemon>> fetchPokemonList() async {
    debugPrint('Fetching');
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
    final imageSVG = SvgPicture.network(imageURL);

    final stats = data["stats"] as List; //Getting stats

    // var hp = '0';
    // var attack = '0';
    // var defence = '0';
    // var speed = '0';

    final hp = int.tryParse(stats[0]["base_stat"].toString()) ?? 0;

    final attack = int.tryParse(stats[1]["base_stat"].toString()) ?? 0;
    final defence = int.tryParse(stats[2]["base_stat"].toString()) ?? 0;
    final speed = int.tryParse(stats[5]["base_stat"].toString()) ?? 0;

    return Pokemon(
        name: name,
        imageSVG: imageSVG,
        hp: hp,
        defense: defence,
        speed: speed,
        attack: attack);
  }
}
