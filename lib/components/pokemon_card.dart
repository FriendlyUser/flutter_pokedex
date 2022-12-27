import 'dart:async';
import 'package:flutter/material.dart';
import "package:pokedex/components/custom_image_view.dart";
import "package:pokedex/theme/app_decoration.dart";
import "package:pokedex/theme/size_utils.dart";
import "package:pokedex/core/utils/get_data.dart";

import "../core/utils/image_constant.dart";
import "../theme/app_style.dart";

// ignore: must_be_immutable
class PokemonCard extends StatelessWidget {
  final int pokemonId;
  PokemonCard({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    // get pokemon element from id and use future builder to get data
    
    return Container(
      decoration: AppDecoration.outlineBluegray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: FutureBuilder<Pokemon>(
          future: getPokemonFromId(pokemonId),
          builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
            if( snapshot.connectionState == ConnectionState.waiting){
              // return loader
              return  Center(child: Text('Please wait its loading...'));
            } else {
                if (snapshot.hasError)
                  return Center(child: Text('Error: ${snapshot.error}'));
                else {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                        height: getVerticalSize(
                          300.00,
                        ),
                        width: getHorizontalSize(
                          300.00,
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
                                "#" + "1",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsRegular8Bluegray200.copyWith(
                                  height: 1.50,
                                ),
                              ),
                            ),
                            CustomImageView(
                              url: snapshot.data?.imgSrc ?? "",
                              alignment: Alignment.bottomLeft,
                              height: 72.0,
                              width: 72.0,
                            ),
                          ],
                        ),
                        )
                      ), 
                      Expanded(
                        child:  Container(
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
                          snapshot.data?.name?.toUpperCase() ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsRegular10WhiteA700.copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
                                        ),
                    ],
                  );  // snapshot.data  :- get your object which is pass from your downloadData() function
                }
            }
          }
        )
      );
  }
}
