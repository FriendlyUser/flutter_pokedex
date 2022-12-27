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
