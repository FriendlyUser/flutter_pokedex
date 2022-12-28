import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/poke_classes.dart';


Future<PokemonDetails> fetchPokemonDetails(String pokemonName) async  {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonName'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PokemonDetails.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to the pokemon');
  }
}

// load pokemon species
Future<PokemonSpecies> fetchPokemonSpecies(String url) async {
  final response = await http
      .get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PokemonSpecies.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to the pokemon');
  }
}
