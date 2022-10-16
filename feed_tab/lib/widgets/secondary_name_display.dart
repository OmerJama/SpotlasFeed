import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/utils/constants.dart';
import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';

class SecondaryNameDisplay extends StatelessWidget {
  final String text;

  const SecondaryNameDisplay({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(20),
        width: getProportionateScreenWidth(235),
        child: Text(
          text,
          style: secondaryTextStyle,
        ));
  }
}
