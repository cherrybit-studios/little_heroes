// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      strength: json['strength'] as int,
      dexterity: json['dexterity'] as int,
      intelligence: json['intelligence'] as int,
      stamina: json['stamina'] as int,
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'strength': instance.strength,
      'dexterity': instance.dexterity,
      'intelligence': instance.intelligence,
      'stamina': instance.stamina,
    };

Hero _$HeroFromJson(Map<String, dynamic> json) => Hero(
      id: json['id'] as String?,
      name: json['name'] as String,
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
      body: $enumDecode(_$BodyEnumMap, json['body']),
      outfit: $enumDecode(_$OutfitEnumMap, json['outfit']),
      weapon: $enumDecodeNullable(_$WeaponEnumMap, json['weapon']),
      shield: $enumDecodeNullable(_$ShieldEnumMap, json['shield']),
      captain: json['captain'] as bool? ?? false,
    );

Map<String, dynamic> _$HeroToJson(Hero instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'attributes': instance.attributes.toJson(),
      'body': _$BodyEnumMap[instance.body]!,
      'outfit': _$OutfitEnumMap[instance.outfit]!,
      'captain': instance.captain,
      'weapon': _$WeaponEnumMap[instance.weapon],
      'shield': _$ShieldEnumMap[instance.shield],
    };

const _$BodyEnumMap = {
  Body.human1: 'human1',
  Body.human2: 'human2',
  Body.elf: 'elf',
  Body.orc: 'orc',
  Body.imp: 'imp',
};

const _$OutfitEnumMap = {
  Outfit.villager: 'villager',
  Outfit.knight: 'knight',
  Outfit.mage: 'mage',
  Outfit.archer: 'archer',
  Outfit.monk: 'monk',
  Outfit.barbarian: 'barbarian',
  Outfit.ninja: 'ninja',
  Outfit.samurai: 'samurai',
};

const _$WeaponEnumMap = {
  Weapon.sword: 'sword',
  Weapon.katana: 'katana',
  Weapon.axe: 'axe',
  Weapon.bow: 'bow',
  Weapon.staff: 'staff',
  Weapon.spear: 'spear',
};

const _$ShieldEnumMap = {
  Shield.wooden: 'wooden',
  Shield.steel: 'steel',
  Shield.buckler: 'buckler',
  Shield.targe: 'targe',
  Shield.holy: 'holy',
  Shield.kite: 'kite',
};
