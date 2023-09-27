import 'package:flutter/material.dart';
import 'fetures/pokemon_list/pokemon_list_screen.dart';
import 'fetures/pokemon_details/pokemon_details_screen.dart';

void main() {
  runApp(const FirstFlutterApp());
}

class FirstFlutterApp extends StatelessWidget {
  const FirstFlutterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter First App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color.fromARGB(255, 9, 37, 66),
        dividerTheme: const DividerThemeData(color: Colors.blueGrey),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
          bodySmall: TextStyle(
            color: Colors.white38,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
      routes: {
        '/': (context) => const PokemonList(),
        '/pokemon_details': (context) => const PokemonDetails(),
      },
    );
  }
}
