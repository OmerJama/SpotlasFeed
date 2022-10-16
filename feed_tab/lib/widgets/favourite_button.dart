import 'package:feed_tab/utils/constants.dart';
import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouiteButton extends StatefulWidget {
  const FavouiteButton({Key? key}) : super(key: key);

  @override
  State<FavouiteButton> createState() => _FavouiteButtonState();
}

class _FavouiteButtonState extends State<FavouiteButton> {
  bool favouriteClicked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            favouriteClicked = !favouriteClicked;
          });
        },
        icon: favouriteClicked == true
            ? SvgPicture.asset(
                starClickedAsset,
                color: favouritedColour,
                height: getProportionateScreenHeight(23.04),
                width: getProportionateScreenWidth(24),
              )
            : SvgPicture.asset(
                starAsset,
                color: Colors.white,
                height: getProportionateScreenHeight(23.04),
                width: getProportionateScreenWidth(24),
              ));
  }
}
