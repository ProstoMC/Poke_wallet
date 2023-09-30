import 'package:first_app/repositories/pokemon_list_repository.dart';
import 'package:first_app/router.dart';
import 'package:first_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton(PokemonListRepository());
  runApp(const FirstFlutterApp());
}

class FirstFlutterApp extends StatelessWidget {
  const FirstFlutterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: mainTheme,
      routes: router,
    );
  }
}
