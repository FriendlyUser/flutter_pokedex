import 'package:flutter/material.dart';
import "package:pokedex/components/custom_image_view.dart";
import "package:pokedex/theme/app_decoration.dart";
import "package:pokedex/theme/size_utils.dart";

import "../core/utils/image_constant.dart";
import "../theme/app_style.dart";

// ignore: must_be_immutable
class PokemonCard extends StatelessWidget {
  final String pokemonId;
  PokemonCard({super.key, required this.pokemonId});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBluegray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: getVerticalSize(
              83.00,
            ),
            width: getHorizontalSize(
              80.00,
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
                  child: Text(
                    "#304",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular8Bluegray200.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage17,
                  height: getSize(
                    72.00,
                  ),
                  width: getSize(
                    72.00,
                  ),
                  alignment: Alignment.bottomLeft,
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
              right: 40,
              bottom: 3,
            ),
            decoration: AppDecoration.txtFillBluegray200,
            child: Text(
              "Aron",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsRegular10WhiteA700.copyWith(
                height: 1.50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
