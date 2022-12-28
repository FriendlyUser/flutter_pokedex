// simple widget that takes an pokemon as an input
import 'package:flutter/material.dart';
import '../core/utils/get_data.dart';
import '../core/utils/size_utils.dart';
import '../core/utils/type_to_color.dart';
import '../theme/app_style.dart';
import '../theme/app_decoration.dart';

class PokemonTypes extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonTypes({Key? key, required this.pokemon}) : super(key: key);

  List<Widget> buildTypes() {
    if (pokemon.pokemonV2Pokemontypes == null) {
      return [];
    }
    List<Widget> types = [];
    pokemon.pokemonV2Pokemontypes?.forEach((e) {
      // got border for type
      var colors = getColorsFromType(e.pokemonV2Type?.name ?? " ");
      var typeLabel = Container(
        decoration: colors[1].copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Padding(
          padding: getPadding(
            top: 1,
            right: 5,
            left: 5,
          ),
          child: Text(
            e.pokemonV2Type?.name ?? " ",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsBold10WhiteA700.copyWith(
              height: 1.50,
            ),
          ),
        )
      );
      types.add(typeLabel);
    });
    return types;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: buildTypes(),
    );
  }
}
