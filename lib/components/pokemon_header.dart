// simple widget that takes an pokemon as an input
import 'package:flutter/material.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/get_data.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_decoration.dart';
import '../theme/app_style.dart';
import 'custom_image_view.dart';

class PokemonHeader extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonHeader({Key? key, required this.pokemon}) : super(key: key);

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    // PokemonHeader
    // first letter capitalized
    var pokemonName = pokemon.name ?? " ";

    if (pokemonName != " ") {
      pokemonName = capitalize(pokemonName);
    }
    return Stack(children: [
      Align(
          alignment: Alignment.topRight,
          child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: getMargin(right: 4),
              color: ColorConstant.whiteA70063,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.circleBorder104),
              child: Container(
                  height: getVerticalSize(167.00),
                  width: getHorizontalSize(208.00),
                  padding: getPadding(left: 20, top: 8, right: 24, bottom: 8),
                  decoration: AppDecoration.fillWhiteA70063.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder104)
                  ))),
      CustomImageView(
          url: pokemon.imgSrc,
          height: getSize(200.00),
          width: getSize(200.00),
          alignment: Alignment.topRight,
          margin: getMargin(top: 31, right: 62)
        ),
      Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: getPadding(left: 60),
              child: Text(pokemonName,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsBold24WhiteA700
                      .copyWith(height: 1.50)))),
      CustomImageView(
          svgPath: ImageConstant.imgArrowleft,
          height: getVerticalSize(16.00),
          width: getHorizontalSize(8.00),
          alignment: Alignment.topLeft,
          margin: getMargin(left: 24, top: 143),
          onTap: () {
            onTapImgArrowleft();
          }),
          CustomImageView(
            svgPath: ImageConstant.imgArrowright,
            height: getVerticalSize(16.00),
            width: getHorizontalSize(8.00),
            alignment: Alignment.bottomRight,
            onTap: () {
              onTapImgArrowright();
            })
    ]);
  }

  @override
  onTapImgArrowleft() {
    // Get.toNamed(AppRoutes.pokemonScreen);
  }
  @override
  onTapImgArrowright() {
    // Get.toNamed(AppRoutes.charmanderScreen);
  }
}
// Compare this snippet from lib/screens/pokemon_details.dart:
// import 'package:flutter/material.dart';
// import 'package:pokedex/components/pokemon_card.dart';
// 
// import '../core/utils/get_data.dart';
// 
// class PokemonDetails extends StatefulWidget {
//   int pokemonId;
// 
//   PokemonDetails({Key? key, required this.pokemonId}) : super(key: key);
// 
//   @override
//   _PokemonDetailsState createState() => _PokemonDetailsState();
// }
// 
// class _PokemonDetailsState extends State<PokemonDetails> {
//   late Pokemon pokemon;
//   bool isLoading = false;
//   @override
//   void initState() {
//     super.initState();
//     ////LOADING FIRST  DATA
//     isLoading = true;
//     readJson().then((resultat) {
//       pokemon = resultat[widget.pokemonId - 1];
//       isLoading = false;
//       setState(() {});
//     });
//   }
// 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pokemon Details'),
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : FutureBuilder(builder: (context, snapshot) {
//                 // if not ready
//                 if (snapshot.hasError) {
//