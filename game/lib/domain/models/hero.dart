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
  villager,
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
class Attributes extends Equatable {
  const Attributes({
    required this.strength,
    required this.dexterity,
    required this.intelligence,
    required this.stamina,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return _$AttributesFromJson(json);
  }

  const Attributes.empty()
      : this(
          strength: 0,
          dexterity: 0,
          intelligence: 0,
          stamina: 0,
        );

  final int strength;
  final int dexterity;
  final int intelligence;
  final int stamina;

  Attributes copyWith({
    int? strength,
    int? dexterity,
    int? intelligence,
    int? stamina,
  }) {
    return Attributes(
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      intelligence: intelligence ?? this.intelligence,
      stamina: stamina ?? this.stamina,
    );
  }

  Map<String, dynamic> toJson() => _$AttributesToJson(this);

  @override
  List<Object> get props => [strength, dexterity, intelligence, stamina];
}

@JsonSerializable(explicitToJson: true)
class Hero extends Equatable {
  const Hero({
    required this.id,
    required this.name,
    required this.attributes,
    required this.body,
    required this.outfit,
    required this.weapon,
    required this.shield,
    this.captain = false,
  });

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);

  final String? id;
  final String name;
  final Attributes attributes;
  final Body body;
  final Outfit outfit;
  final bool captain;
  final Weapon? weapon;
  final Shield? shield;

  Hero copyWithName(String name) {
    return Hero(
      id: id,
      name: name,
      attributes: attributes,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
      captain: captain,
    );
  }

  Hero copyWithAttributes(Attributes attributes) {
    return Hero(
      id: id,
      name: name,
      attributes: attributes,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
      captain: captain,
    );
  }

  Hero copyWithBody(Body body) {
    return Hero(
      id: id,
      name: name,
      attributes: attributes,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
      captain: captain,
    );
  }

  Hero copyWithOutfit(Outfit outfit) {
    return Hero(
      id: id,
      name: name,
      attributes: attributes,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
      captain: captain,
    );
  }

  Hero copyWithWeapon(Weapon? weapon) {
    return Hero(
      id: id,
      name: name,
      attributes: attributes,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
      captain: captain,
    );
  }

  Hero copyWithShield(Shield? shield) {
    return Hero(
      id: id,
      name: name,
      attributes: attributes,
      body: body,
      outfit: outfit,
      weapon: weapon,
      shield: shield,
      captain: captain,
    );
  }

  Map<String, dynamic> toJson() => _$HeroToJson(this);

  Map<String, dynamic> toData() {
    return toJson()..remove('id');
  }

  @override
  List<Object?> get props =>
      [id, name, body, outfit, weapon, outfit, shield, attributes, captain];
}
