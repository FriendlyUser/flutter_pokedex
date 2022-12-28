import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card.dart';

import '../core/utils/get_data.dart';

class PokemonDetails extends StatefulWidget {
  final int pokemonId;

  const PokemonDetails({Key? key, required this.pokemonId}) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  late Pokemon pokemon;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    ////LOADING FIRST  DATA
    isLoading = true;
    readJson().then((resultat) {
      pokemon = resultat[widget.pokemonId - 1];
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Details'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder(builder: (context, snapshot) {
                // if not ready
                if  (snapshot.hasError) {
                  return const Text(
                    'Error',
                  );
                }
                // if ready
                if (snapshot.hasData) {
                  return const Text(
                    'Data'
                  );
                }
                // if loading
                return const Text(
                  'Loading',
                );
                // return CircularProgressIndicator(
                //   color: ColorConstant.yellow600,
                // );
              })
    );