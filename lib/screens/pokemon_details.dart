import '../components/custom_image_view.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../theme/app_decoration.dart';
import '../theme/app_style.dart';
import '../theme/size_utils.dart';
import 'package:flutter/material.dart';

class PokemonDetails extends StatefulWidget {
  int pokemonId;

   PokemonDetails ({ Key? key, required this.pokemonId }): super(key: key);
  // pokemon id param
  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}
class _PokemonDetailsState extends State<PokemonDetails> {
  // pokemon id param
  @override
  Widget build(BuildContext context) {
    // print pokemon id
    print(widget.pokemonId);
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.yellow600,
            body: Container(
                // Future Builder
                // child: FutureBuilder(builder: (context, snapshot) => {})
              )
            )
          );
  }

  // onTapImgArrowright() {
  //   Get.toNamed(AppRoutes.gastlyScreen);
  // }

  // onTapImgArrowleft() {
  //   Get.toNamed(AppRoutes.butterfreeScreen);
  // }
}
