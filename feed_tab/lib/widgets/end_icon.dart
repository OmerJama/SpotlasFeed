import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EndIcon extends StatelessWidget {
  final String assetName;

  const EndIcon({required this.assetName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          assetName,
          color: const Color(0xFFFFFFFF),
          height: getProportionateScreenHeight(24),
          width: getProportionateScreenWidth(24),
        ));
  }
}
