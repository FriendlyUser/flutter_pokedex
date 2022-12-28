// simple widget that takes an pokemon species id as an input
// and renders a description
import 'package:flutter/material.dart';
import '../core/utils/size_utils.dart';

class PokemonDescription extends StatelessWidget {
  final String description;

  const PokemonDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pokemonDescription = description ?? " ";
    // text 100% width, word wrap
    return Row(
        // space evenly
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  pokemonDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                )),
          ),
        ],
    );
  }
}
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 

// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
//