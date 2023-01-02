import 'package:flutter/material.dart';
import "package:pokedex/components/custom_image_view.dart";
import "package:pokedex/components/touchable_opacity.dart";
import "package:pokedex/theme/app_decoration.dart";
import "package:pokedex/theme/size_utils.dart";
import 'package:badges/badges.dart';
import 'package:go_router/go_router.dart';

import "../core/utils/get_data.dart";
import "../core/utils/image_constant.dart";
import "../core/utils/type_to_color.dart";
import "../theme/app_style.dart";

// ignore: must_be_immutable
class PokemonCard extends StatelessWidget {
  PokemonCard(this.pokemon);

  Pokemon pokemon;

  @override
  List<Widget> labelsForTypes(Pokemon mon) {
    List<Widget> labels = [];
    for (var type in mon?.pokemonV2Pokemontypes) {
      // map type to color
      var typeName = type?.pokemonV2Type?.name ?? "";
      var colors = getColorsFromType(typeName);
      var mainColor = colors[0];
      var secondaryColor = colors[1];
      labels.add(Chip(
        padding: EdgeInsets.all(0),
        backgroundColor: mainColor.color,
        label: Text(typeName,
            style: TextStyle(color: secondaryColor.color, fontSize: 12)),
      ));
    }
    return labels;
  }

  @override
  Widget build(BuildContext context) {
    // get name from pokemon or default it to empty string
    String name = pokemon.name ?? "";
    // get id from pokemon or default it to 0
    int id = pokemon.id ?? 0;

    String imgSrc = pokemon.imgSrc ?? "";
    // scale images and text on desktop
    int fontSize = 12;
    double imgSize = 72;
    if (MediaQuery.of(context).size.width > 900) {
      fontSize = 24;
      imgSize = 144;
    }
    // get pokemon type
    String type = pokemon?.pokemonV2Pokemontypes?[0]?.pokemonV2Type?.name ?? "";
    // need to center image and boost text size
    // and boost font size
    // image size
    var colors = getColorsFromType(type);
    var mainColor = colors[0];
    var secondaryColor = colors[1];

    // swap based on pokemon type
    return Container(
      decoration: mainColor.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: TouchableOpacity(
        onTap: () {
          // navigate to pokemon detail page with pokemon id
          // go router

          // Navigator.pushNamed(context, "/pokemon/$id");
          // Navigator.pushNamed(context, "/pokemon/:id");
          context.go('/pokemon/$id');
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: getVerticalSize(
                83.00,
              ),
              width: getHorizontalSize(
                160.00,
              ),
              margin: getMargin(
                top: 4,
                right: 8,
              ),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(children: [
                      ...labelsForTypes(pokemon),
                      Text(
                        "# " + id.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular8Bluegray200.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ]),
                  ),
                  CustomImageView(
                    url: imgSrc,
                    height: getSize(
                      imgSize,
                    ),
                    width: getSize(
                      imgSize,
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
            ),
            Container(
              width: getHorizontalSize(
                104.00,
              ),
              padding: getPadding(
                left: 30,
                top: 3,
                // right: 40,
                bottom: 3,
              ),
              decoration: secondaryColor,
              child: Text(
                name.toString(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular10WhiteA700.copyWith(
                  height: 1.50,
                  // bold
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
