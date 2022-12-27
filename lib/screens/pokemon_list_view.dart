// simple list view with animation
import 'package:flutter/material.dart';
import 'package:pokedex/components/empty_card.dart';

import '../components/pokemon_card.dart';
import '../core/utils/get_data.dart';

class PokemonListView extends StatefulWidget {
  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  List dataList = <Pokemon>[];
  bool isLoading = false;
  int pageCount = 1;
  late ScrollController _scrollController;

  // all pokemone list
  List<Pokemon> allPokemonList = <Pokemon>[];
  // scroll view right now
  List<Pokemon> pokemonList = <Pokemon>[];

  @override
  void initState() {
    super.initState();

    ////LOADING FIRST  DATA
    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    readJson().then((resultat) {
      setState(() => allPokemonList = (resultat));
      addItemIntoList(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    var columnCount = 3;
    // if allPokemonList is empty then show empty card
    if (allPokemonList.isEmpty) {
      return EmptyCard();
    }
    // row count based on media query
    if (MediaQuery.of(context).size.width < 600) {
      columnCount = 2;
    } else if (MediaQuery.of(context).size.width < 900) {
      columnCount = 3;
    } else {
      columnCount = 6;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon List View'),
        ),
        body: GridView.count(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          crossAxisCount: columnCount,
          mainAxisSpacing: 10.0,
          physics: const AlwaysScrollableScrollPhysics(),
          children: pokemonList.map((pokemon) {
            return PokemonCard(pokemon);
          }).toList(),
          // padding bottom
          padding: const EdgeInsets.only(bottom: 500),
        ));
  }

  //// ADDING THE SCROLL LISTINER
  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        isLoading = true;

        if (isLoading) {

          pageCount = pageCount + 1;

          addItemIntoList(pageCount);
        }
      });
    }
  }

  ////ADDING DATA INTO ARRAYLIST
  void addItemIntoList(var pageCount) {

    // if allPokemonList is empty return
    if (allPokemonList.isEmpty) {
      return;
    }
    var numElements = 10;
    // add more for windows platform
    if (MediaQuery.of(context).size.width > 900) {
      numElements = 30;
    }
    // slice the list from get_data.dart file
    var list = allPokemonList.sublist(0, (numElements * pageCount) as int?);
    setState(() {
      pokemonList = list;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
