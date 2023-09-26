import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
