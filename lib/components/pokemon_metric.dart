// simple pokemon widget that takes an pokemon as an text input, icon input and label
import 'package:flutter/material.dart';
import '../core/utils/size_utils.dart';
import 'custom_image_view.dart';

class PokemonMetric extends StatelessWidget {
  final String label;
  final String text;
  final String icon;

  const PokemonMetric(
      {Key? key, required this.label, required this.text, required this.icon})
      : super(key: key);

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    // PokemonMetric
    // first letter capitalized
    var pokemonMetricLabel = label ?? " ";
    var pokemonMetricText = text ?? " ";
    var pokemonMetricIcon = icon ?? " ";

    if (pokemonMetricLabel != " ") {
      pokemonMetricLabel = capitalize(pokemonMetricLabel);
    }
    return Padding(
        padding: getPadding(right: 10),
        child: Column(children: [
          Row(children: [
            CustomImageView(
              svgPath: pokemonMetricIcon,
              height: getSize(24.00),
              width: getSize(24.00),
              alignment: Alignment.topRight,
              // margin: getMargin(top: 31, right: 62)
            ),
            Padding(
                padding: getPadding(left: 10), child: Text(pokemonMetricLabel))
          ]),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: getPadding(top: 25),
                  child: Text(pokemonMetricText))),
        ]));
  }
}
