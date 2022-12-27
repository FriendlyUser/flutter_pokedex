// get json data
import 'package:flutter/services.dart';
import 'dart:core';
import 'dart:async';
import 'dart:convert';

class Pokemon {
  String? name;
  int? id;
  int? pokemonSpeciesId;
  List<PokemonV2Pokemontypes>? pokemonV2Pokemontypes;
  String? imgSrc;

  Pokemon(
      {this.name,
      this.id,
      this.pokemonSpeciesId,
      this.pokemonV2Pokemontypes,
      this.imgSrc});
  

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    pokemonSpeciesId = json['pokemon_species_id'];
    if (json['pokemon_v2_pokemontypes'] != null) {
      pokemonV2Pokemontypes = <PokemonV2Pokemontypes>[];
      json['pokemon_v2_pokemontypes'].forEach((v) {
        pokemonV2Pokemontypes!.add(new PokemonV2Pokemontypes.fromJson(v));
      });
    }

    imgSrc = "https:" +json['img_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['pokemon_species_id'] = this.pokemonSpeciesId;
    if (this.pokemonV2Pokemontypes != null) {
      data['pokemon_v2_pokemontypes'] =
          this.pokemonV2Pokemontypes!.map((v) => v.toJson()).toList();
    }
    data['img_src'] = this.imgSrc;
    return data;
  }
}

class PokemonV2Pokemontypes {
  PokemonV2Type? pokemonV2Type;

  PokemonV2Pokemontypes({this.pokemonV2Type});

  PokemonV2Pokemontypes.fromJson(Map<String, dynamic> json) {
    pokemonV2Type = json['pokemon_v2_type'] != null
        ? new PokemonV2Type.fromJson(json['pokemon_v2_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonV2Type != null) {
      data['pokemon_v2_type'] = this.pokemonV2Type!.toJson();
    }
    return data;
  }
}

class PokemonV2Type {
  String? name;
  int? moveDamageClassId;
  int? generationId;
  int? id;

  PokemonV2Type(
      {this.name, this.moveDamageClassId, this.generationId, this.id});

  PokemonV2Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    moveDamageClassId = json['move_damage_class_id'];
    generationId = json['generation_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['move_damage_class_id'] = this.moveDamageClassId;
    data['generation_id'] = this.generationId;
    data['id'] = this.id;
    return data;
  }
}


Future<List<Pokemon>> readJson() async {
  final String response = await rootBundle.loadString('assets/clean_pokemon.json');
  // read into Pokemon Type List
  // convert json map to list
  final rawObjects = jsonDecode(response);
  // iterate across and add to Pokemon List
  // map across _JsonMap and convert to Pokemon
  final pokemonList = rawObjects.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  // return pokemon
  return pokemonList;
// ... 
}

// get pokemon from id
Future<Pokemon> getPokemonFromId(int id) async {
  final pokemonList = await readJson();
  final pokemon = pokemonList.where((pokemon) => pokemon.id == id).toList()[0];
  return pokemon;
}