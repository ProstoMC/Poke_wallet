import 'package:first_app/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key});

  @override
  State<PokemonDetails> createState() => PokemonDetailsState();
}

class PokemonDetailsState extends State<PokemonDetails> {
  var pokemon = Pokemon(
      name: 'Pokemon',
      imageSVG: SvgPicture.asset('assets/svg/pokeball.svg'),
      hp: 0,
      attack: 0,
      defense: 0,
      speed: 0);

  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments == null || arguments is! Pokemon) {
      return;
    }
    pokemon = arguments;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 9, 37, 66),
        title: Text(pokemon.name),
      ),
      body: Container(
        alignment: const FractionalOffset(0.5, 0.1),
        margin: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
        child: PokemonViewColumn(pokemon: pokemon),
      ),
    );
  }
}

class PokemonViewColumn extends StatelessWidget {
  const PokemonViewColumn({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 2,
          child: pokemon.imageSVG,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width / 10,
        ),
        StatsRow(pokemon: pokemon),
      ],
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Health: '),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Text('Attack: '),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Text('Defence: '),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Text('Speed: '),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pokemon.hp.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Text(pokemon.attack.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Text(pokemon.defense.toString()),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Text(pokemon.speed.toString()),
              ],
            )
          ],
        )
      ],
    );
  }
}




//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text('HP: '),
//             Text('Attack: '),
//             Text('Defence: '),
//             Text('Speed: '),
//           ],
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(pokemon.hp.toString()),
//             Text(pokemon.attack.toString()),
//             Text(pokemon.defense.toString()),
//             Text(pokemon.speed.toString()),
//           ],
//         )
//       ],
//     );
//   }
// }
