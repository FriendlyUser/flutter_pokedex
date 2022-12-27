// simple widget to display a pokemon type color changes based on type
import 'package:flutter/widgets.dart';

import '../theme/app_decoration.dart';
import '../theme/app_style.dart';

class PokemonType extends StatelessWidget {
  final String type;
  const PokemonType({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // swap colors based on type
    return Container(
      decoration: AppDecoration.outlineBluegray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Text(
        type,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: AppStyle.txtPoppinsRegular8Bluegray200.copyWith(
          height: 1.50,
        ),
      ),
    );
  }
}

// Path: lib/components/pokemon_card.dart
// Compare this snippet from lib/theme/app_decoration.dart:
//         color: ColorConstant.lime700,
//       );
//   static BoxDecoration get outlinePinkA200 => BoxDecoration(
//         color: ColorConstant.whiteA700,
//         border: Border.all(
//           color: ColorConstant.pinkA200,
//           width: getHorizontalSize(
//             1.00,
//           ),
//         ),
//       );
//   static BoxDecoration get outlineYellow600 => BoxDecoration(
//         color: ColorConstant.whiteA700,
//         border: Border.all(
//           color: ColorConstant.yellow600,
//           width: getHorizontalSize(
//             1.00,
//           ),
//         ),
//       );
//   static BoxDecoration get txtFillYellow600 => BoxDecoration(
//         color: ColorConstant.yellow600,
//       );
//   static BoxDecoration get fillYellow600 => BoxDecoration(
//         color: ColorConstant.yellow600,
//       );
//   static BoxDecoration get txtFillLightgreen500 => BoxDecoration(
//         color: ColorConstant.lightGreen500,
//       );
//   static BoxDecoration get outlineBluegray200 => BoxDecoration(
//         color: ColorConstant.whiteA700,
//         border: Border.all(
//           color: ColorConstant.blueGray200,
//           width: getHorizontalSize(
//             1.00,
//           ),
//         ),
//       );
//   static BoxDecoration get outlineLime700 => BoxDecoration(
//         color: ColorConstant.whiteA700,
//         border: Border.all(
//           color: ColorConstant.lime700,
//           width: getHorizontalSize(
//             1.00,
//           ),
//         ),
//       );
//   static BoxDecoration get fillDeeppurple500 => BoxDecoration