import 'package:equatable/equatable.dart';

enum Body {
  human1,
  human2,
  elf,
  orc,
  imp,
}

enum Outfit {
  villager,
  knight,
  mage,
  archer,
  monk,
  barbarian,
  ninja,
  samurai,
  darkMage,
  ranger,
  cleric,
}

enum Weapon {
  sword,
  katana,
  axe,
  bow,
  staff,
  spear,
  holyStaff,
  darkStaff,
}

enum Shield {
  wooden,
  steel,
  buckler,
  targe,
  holy,
  kite,
}

class Hero extends Equatable {
  const Hero({
    required this.name,
    required this.body,
    required this.outfit,
    required this.weapon,
    required this.shield,
  });

  final String name;
  final Body body;
  final Outfit outfit;
  final Weapon? weapon;
  final Shield? shield;

  Hero copyWithName(String name) {
    return Hero(
      name: name,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
    );
  }

  Hero copyWithBody(Body body) {
    return Hero(
      name: name,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
    );
  }

  Hero copyWithOutfit(Outfit outfit) {
    return Hero(
      name: name,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
    );
  }

  Hero copyWithWeapon(Weapon? weapon) {
    return Hero(
      name: name,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
    );
  }

  Hero copyWithShield(Shield? shield) {
    return Hero(
      name: name,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
    );
  }

  @override
  List<Object?> get props =>
      [ name, body, outfit, weapon, outfit, shield];
}
