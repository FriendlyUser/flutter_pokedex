// get pokemon type
import 'package:flutter/material.dart';

import '../../theme/app_decoration.dart';



List<BoxDecoration> getColorsFromType(String type) {
  List<BoxDecoration> colors = [];
  BoxDecoration mainDecoration = AppDecoration.outlineBluegray200;
  // text decoration
  BoxDecoration textDecoration = AppDecoration.txtFillBluegray200;
  
  // switch types and colors based on type
  switch (type) {
    case "normal":
      mainDecoration = AppDecoration.outlineBluegray200;
      textDecoration = AppDecoration.txtFillBluegray200;
      break;
    case "fire":
      mainDecoration = AppDecoration.outlineRedgray200;
      textDecoration = AppDecoration.txtFillRedA700;
      break;
    case "water":
      mainDecoration = AppDecoration.outlineBlue300;
      textDecoration = AppDecoration.txtFillBlueA700;
      break;

    case "grass":
      mainDecoration = AppDecoration.outlineLightgreen500;
      textDecoration = AppDecoration.txtFillLightgreen500;
      break;
    case "electric":
      mainDecoration = AppDecoration.outlineYellow600;
      textDecoration = AppDecoration.txtFillYellow600;
      break;
    case "ice":
      mainDecoration = AppDecoration.outlineBlue300;
      textDecoration = AppDecoration.txtFillBlueA700;
      break;
    case "fighting":
      mainDecoration = AppDecoration.outlineDeeporangeA200;
      textDecoration = AppDecoration.fillDeeporangeA200;
      break;
    case "poison":
      mainDecoration = AppDecoration.outlinePurple500;
      textDecoration = AppDecoration.fillDeeppurple500;
      break;
    case "ground":
      mainDecoration = AppDecoration.outlineBrown500;
      textDecoration = AppDecoration.txtFillBrown500;
      break;

    case "flying":
      mainDecoration = AppDecoration.outlineBrown300;
      textDecoration = AppDecoration.txtFillBrown500;
      break;
    case "psychic":
      mainDecoration = AppDecoration.outlinePinkA200;
      textDecoration = AppDecoration.txtFillPinkA200;
      break;
    case "bug":
      mainDecoration = AppDecoration.outlineLime700;
      textDecoration = AppDecoration.txtFillLime700;
      break;
    // fairy
    case "fairy":
      mainDecoration = AppDecoration.outlinePinkA200;
      textDecoration = AppDecoration.txtFillPinkA200;
      break;
    case "rock":
      mainDecoration = AppDecoration.outlineBrown500;
      textDecoration = AppDecoration.txtFillBrown500;
      break;
    case "ghost":
      // mainDecoration = AppDecoration.outlineIndigoA200;
      // textDecoration = AppDecoration.txtFillIndigoA200;
      break;
    case "dragon":
      mainDecoration = AppDecoration.outlineIndigoA200;
      textDecoration = AppDecoration.txtFillIndigoA200;
      break;
    case "dark":
      mainDecoration = AppDecoration.outlineBlack500;
      textDecoration = AppDecoration.fillWhiteA700;
      break;
    // ghost
    case "steel":
      mainDecoration = AppDecoration.outlineGray900;
      textDecoration = AppDecoration.txtFillGray900;
      break;
    case "ghost":
      mainDecoration = AppDecoration.outlineBlackBlue;
      textDecoration = AppDecoration.fillWhiteA70063;
      break;
  }
  colors.add(mainDecoration);
  colors.add(textDecoration);
  return colors;
}