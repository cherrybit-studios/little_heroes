// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hero _$HeroFromJson(Map<String, dynamic> json) => Hero(
      name: json['name'] as String,
      body: $enumDecode(_$BodyEnumMap, json['body']),
      outfit: $enumDecode(_$OutfitEnumMap, json['outfit']),
      weapon: $enumDecodeNullable(_$WeaponEnumMap, json['weapon']),
      shield: $enumDecodeNullable(_$ShieldEnumMap, json['shield']),
    );

Map<String, dynamic> _$HeroToJson(Hero instance) => <String, dynamic>{
      'name': instance.name,
      'body': _$BodyEnumMap[instance.body]!,
      'outfit': _$OutfitEnumMap[instance.outfit]!,
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
