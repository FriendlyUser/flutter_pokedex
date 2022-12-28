import 'package:pokedex/core/api/poke_api.dart';

import '../components/custom_image_view.dart';
import '../components/pokemon_metric.dart';
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
import '../theme/app_style.dart';
import '../theme/size_utils.dart';
import 'package:flutter/material.dart';

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
  PokemonDetails? pokemonDetails;

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

  Widget buildMetrics() {
    // if isLoadingDetails is true, return loaded
    var bgColor = getBgColor();
    // parse metrics from pokeomnDetails
    var weight = pokemonDetails?.weight;
    var height = pokemonDetails?.height;
    if (isLoadingDetails == true || weight == null || height == null) {
      return CircularProgressIndicator(color: bgColor);
    }
    // hectograms to kg

    return Row(
      // space between metrics
      children: [
        PokemonMetric(
          text: "weight",
          label: "${(weight * 0.1).toStringAsPrecision(1)} kg",
          icon: ImageConstant.imgMusic,
        ),
        PokemonMetric(
          text: "height",
          label: "${(height * 0.1).toStringAsPrecision(1)} m",
          icon: ImageConstant.imgFrame,
        ),
      ],
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
                      Container(
                          margin: getMargin(
                            bottom: 4,
                          ),
                          padding: getPadding(
                            left: 20,
                            top: 44,
                            right: 20,
                            bottom: 44,
                          ),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 1,
                              width: MediaQuery.of(context).size.width * 1,
                              padding: getPadding(
                                left: 20,
                                top: 8,
                                right: 20,
                                bottom: 8,
                              ),
                              // decoration:
                              //     AppDecoration.fillWhiteA70063.copyWith(
                              //   borderRadius: BorderRadiusStyle.circleBorder104,
                              // ),
                              child: ListView(
                                children: [
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
                                  )

                                  // base stats, draw one chart with fl chart grab data dynamically
                                ],
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
