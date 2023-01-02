import 'package:flutter/material.dart';
import 'package:pokedex/core/api/poke_api.dart';

import '../components/pokemon_description.dart';
import '../components/pokemon_metric.dart';
import '../components/pokemon_stats.dart';
import '../components/pokemon_type.dart';
import '../components/pokemon_types.dart';
import '../components/pokemon_header.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/get_data.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/logger.dart';
import '../core/utils/poke_classes.dart';
import '../core/utils/type_to_color.dart';
import '../theme/app_decoration.dart';
import '../theme/size_utils.dart';

class PokemonDetailsScreen extends StatefulWidget {
  int pokemonId;

  PokemonDetailsScreen({Key? key, required this.pokemonId}) : super(key: key);
  // pokemon id param
  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  late Pokemon pokemon;
  bool isLoading = false;
  bool isLoadingDetails = false;
  bool isLoadingSpecies = false;
  PokemonDetails? pokemonDetails;
  PokemonSpecies? pokemonSpecies;

  void getSpecies(String url) {
    isLoadingSpecies = true;
    try {
      fetchPokemonSpecies(url).then((resultat) {
        // pokemonDetails = resultat;
        pokemonSpecies = resultat;
        setState(() {
          isLoadingSpecies = false;
        });
      })
    } catchError((error) {
      Logger.log(error);
      setState(() {
        isLoadingSpecies = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // reading from json file
    isLoading = true;
    isLoadingDetails = true;
    readJson().then((resultat) {
      // use setState to update pokemon
      pokemon = resultat[widget.pokemonId - 1];
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      Logger.log(error);
      setState(() {
        isLoading = false;
      });
    });
    // LOADING SECOND DATA
    fetchPokemonDetails(widget.pokemonId.toString()).then((resultat) {
      // pokemonDetails = resultat;
      pokemonDetails = resultat;
      setState(() {
        isLoadingDetails = false;
      });
      // get species url
      var speciesUrl = pokemonDetails?.species?.url;
      if (speciesUrl != null) {
        getSpecies(speciesUrl);
      }
    }).catchError((error) {
      Logger.log(error);
      setState(() {
        isLoadingDetails = false;
      });
    });
  }

  Widget buildAbilities() {
    var bgColor = getBgColor();
    // parse metrics from pokeomnDetails
    // get all abilities
    var abilities = pokemonDetails?.abilities ?? [];
    if (isLoadingDetails == true) {
      return CircularProgressIndicator(color: bgColor);
    }
    // if no abilities, return empty container
    if (abilities.isEmpty) {
      return Container();
    }
    // map over abilities and make list of widgets
    var widgets = abilities.map((e) {
      return PokemonAbility(
        ability: e.ability!.name!,
        bgColor: bgColor,
      );
    }).toList();
    return Column(children: widgets);
  }

  Widget buildDescription() {
    var bgColor = getBgColor();
     if (isLoadingSpecies == true) {
      return CircularProgressIndicator(color: bgColor);
    }
    var description = pokemonSpecies?.flavorTextEntries?[0].flavorText;
    // safe render, remove special characters
    description = description?.replaceAll("\f", "");
    // return description
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: PokemonDescription(
        description: description ?? "",
      )
    );
  }

  Widget buildMetrics() {
    // if isLoadingDetails is true, return loaded
    var bgColor = getBgColor();
    // parse metrics from pokeomnDetails
    var weight = pokemonDetails?.weight;
    var height = pokemonDetails?.height;
    if (isLoadingDetails == true || weight == null || height == null) {
      return CircularProgressIndicator(color: bgColor);
    }
    String weightString = ""
    String heightString = ""
    // hectograms to kg
    try {
      weightString = "${(weight * 0.1).toStringAsPrecision(1)} kg";
      heightString = "${(height * 0.1).toStringAsPrecision(1)} m";
    } catch (e) {
      Logger.log(e);
    }
    return Row(
      // space between metrics
      children: [
        PokemonMetric(
          text: "weight",
          label: weightString,
          icon: ImageConstant.imgMusic,
        ),
        PokemonMetric(
          text: "height",
          label: heightString,
          icon: ImageConstant.imgFrame,
        ),
      ],
    );
  }

  Widget buildChart() {
    var bgColor = getBgColor();
    if (isLoadingDetails == true) {
      return CircularProgressIndicator(color: bgColor);
    }
    var stats = pokemonDetails?.stats;
    // get all stats
    if (stats != null && stats.isEmpty) {
      return Container();
    }
    // map over stats and make seriesList
    var seriesList = stats!.map((e) {
      return PokemonBaseStat(
        e.stat!.name!,
        e.baseStat!,
      );
    }).toList();

    // make series from stats
    return Column(
      children: [
        const Text("Base Stats"),
        BarChartWidget(points: seriesList, bgColor: bgColor)
      ]
    );
  }

  Color getBgColor() {
    var bgColor = ColorConstant.whiteA700;
    // make sure pokemon type is set
    if (isLoading == false &&
        pokemon!.pokemonV2Pokemontypes![0].pokemonV2Type?.name != "") {
      var typeName = pokemon.pokemonV2Pokemontypes![0].pokemonV2Type!.name!;
      var colors = getColorsFromType(typeName);
      // update br color
      bgColor = colors[1]!.color!;
    }
    return bgColor;
  }

  // pokemon id param
  @override
  Widget build(BuildContext context) {
    // print pokemon id
    // get color from type
    var bgColor = getBgColor();
    return SafeArea(
        child: Scaffold(
            backgroundColor: bgColor,
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Column(children: [
                      PokemonHeader(
                        pokemon: pokemon,
                      ),
                      Flexible(
                          child: Container(
                              margin: getMargin(
                                bottom: 4,
                              ),
                              padding: getPadding(
                                left: 20,
                                top: 20,
                                right: 20,
                                bottom: 2,
                              ),
                              decoration: AppDecoration.fillWhiteA700.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                              ),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  width: MediaQuery.of(context).size.width * 1,
                                  padding: getPadding(
                                    left: 10,
                                    top: 8,
                                    right: 10,
                                    bottom: 8,
                                  ),
                                  child: ListView(
                                    children: [
                                      buildDescription(),
                                      PokemonTypes(pokemon: pokemon),
                                      // add padding between types and metrics
                                      SizedBox(
                                        height: getVerticalSize(16),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          buildMetrics(),
                                          buildAbilities()
                                        ],
                                      ),
                                      buildChart(),
                                      SizedBox(
                                        height: getVerticalSize(64),
                                      ),
                                      
                                      // base stats, draw one chart with fl chart grab data dynamically
                                    ],
                                  ),
                                  )))
                    ]))));
  }

  // onTapImgArrowright() {
  //   Get.toNamed(AppRoutes.gastlyScreen);
  // }

  // onTapImgArrowleft() {
  //   Get.toNamed(AppRoutes.butterfreeScreen);
  // }
}
