// simple widget to display a pokemon type color changes based on type
import 'package:flutter/widgets.dart';

import '../core/utils/size_utils.dart';
import '../theme/app_decoration.dart';
import '../theme/app_style.dart';

class PokemonAbility extends StatelessWidget {
  final String ability;
  final Color bgColor;
  const PokemonAbility({
    Key? key,
    required this.ability,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // swap colors based on type
    return Container(
      padding: getPadding(
        top: 5,
        right: 5,
        left: 5,
        bottom: 5,
      ),
      margin: getMargin(top: 5, bottom: 5),
      // rounded
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Text(
        ability,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: AppStyle.txtPoppinsBold12.copyWith(
          height: 1.50,
        ),
      ),
    );
  }
}
