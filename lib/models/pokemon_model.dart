import 'package:flutter_svg/svg.dart';

class Pokemon {
  const Pokemon({
    required this.name,
    required this.imageSVG,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.speed,
  });

  final String name;
  final SvgPicture imageSVG;

  final int hp;
  final int attack;
  final int defense;
  final int speed;
}
