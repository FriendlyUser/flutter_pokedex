import '../components/custom_image_view.dart';
import '../components/pokemon_metric.dart';
import '../components/pokemon_type.dart';
import '../components/pokemon_types.dart';
import '../components/pokemon_header.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/get_data.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/type_to_color.dart';
import '../theme/app_decoration.dart';
import '../theme/app_style.dart';
import '../theme/size_utils.dart';
import 'package:flutter/material.dart';

class PokemonDetails extends StatefulWidget {
  int pokemonId;

  PokemonDetails({Key? key, required this.pokemonId}) : super(key: key);
  // pokemon id param
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

  // pokemon id param
  @override
  Widget build(BuildContext context) {
    // print pokemon id
    // get color from type
    Color bgColor = ColorConstant.whiteA700;
    // make sure pokemon type is set
    if (isLoading == false &&
        pokemon!.pokemonV2Pokemontypes![0].pokemonV2Type?.name != "") {
      var typeName = pokemon.pokemonV2Pokemontypes![0].pokemonV2Type!.name!;
      var colors = getColorsFromType(typeName);
      // update br color
      bgColor = colors[1]!.color!;
    }
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
                                      Row(
                                        // space between metrics

                                        children: [
                                          PokemonMetric(
                                            text: "weight",
                                            label: "6.9 kg",
                                            icon: ImageConstant.imgMusic,
                                          ),
                                          PokemonMetric(
                                            text: "height",
                                            label: "0.4 m",
                                            icon: ImageConstant.imgFrame,
                                          ),
                                        ],
                                      ),
                                      Column(children: [
                                        PokemonAbility(
                                          ability: "static",
                                          bgColor: bgColor,
                                        ),
                                        PokemonAbility(
                                          ability: "lightning-rod",
                                          bgColor: bgColor,
                                        ),
                                      ])
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
