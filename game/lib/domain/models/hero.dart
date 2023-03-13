import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hero.g.dart';

enum Body {
  human1,
  human2,
  elf,
  orc,
  imp,
}

enum Outfit {
  knight,
  mage,
  archer,
  monk,
  barbarian,
  ninja,
  samurai,
}

enum Weapon {
  sword,
  katana,
  axe,
  bow,
  staff,
  spear,
}

enum Shield {
  wooden,
  steel,
  buckler,
  targe,
  holy,
  kite,
}

@JsonSerializable()
class Hero extends Equatable {
  const Hero({
    required this.name,
    required this.body,
    required this.outfit,
    required this.weapon,
    required this.shield,
  });

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);

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

  Map<String, dynamic> toJson() => _$HeroToJson(this);

  @override
  List<Object?> get props => [name, body, outfit, weapon, outfit, shield];
}
