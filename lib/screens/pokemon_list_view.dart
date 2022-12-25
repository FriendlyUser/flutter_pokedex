// simple list view with animation
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/components/empty_card.dart';

import '../components/pokemon_card.dart';

class PokemonListView extends StatefulWidget {
  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  @override
  Widget build(BuildContext context) {
    var columnCount = 3;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon List View'),
      ),
      body: SafeArea(
        child: AnimationLimiter(
          child: GridView.count(
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(8.0),
            crossAxisCount: columnCount,
            children: List.generate(
              100,
              (int index) {
                return AnimationConfiguration.staggeredGrid(
                  columnCount: columnCount,
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                    scale: 0.5,
                    child: FadeInAnimation(
                      child: PokemonCard(pokemonId: "1"),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Path: lib/screens/PokemonListView.dart
// simple list view with animation
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class PokemonListView extends StatefulWidget {
//   @override
//   _PokemonListViewState createState() => _PokemonListViewState();
// }

// class _PokemonListViewState extends State<PokemonListView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pokemon List View'),
//       ),
//       body: AnimationLimiter(
//         child: ListView.builder(
//           itemCount: 100,
//           itemBuilder: (BuildContext context, int index) {
//             return AnimationConfiguration.staggeredList(
//               position: index,
//               duration: const Duration(milliseconds: 375),
//               child: SlideAnimation(
//                 verticalOffset: 50.0,
//                 child: FadeInAnimation(
//                   child: ListTile(
//                     title: Text('Title'),
//                     subtitle: Text('subtitle'),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// Path: lib/screens/PokemonListView.dart
// simple list view with animation
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: AnimationLimiter(
//       child: ListView.builder(
//         itemCount: 100,
//         itemBuilder: (BuildContext context, int index) {
//           return AnimationConfiguration.staggeredList(
//             position: index,
//             duration: const Duration(milliseconds: 375),
//             child: SlideAnimation(
//               verticalOffset: 50.0,
//               child: FadeInAnimation(
//                 child: YourListChild(),
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }