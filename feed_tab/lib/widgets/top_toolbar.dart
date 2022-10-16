import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';

class FeedTopBar extends StatelessWidget {
  final String title;
  const FeedTopBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSize()
        .init(context); 
    return Container(
      height: getProportionateScreenHeight(94),
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(56),
            bottom: getProportionateScreenHeight(18),
            left: getProportionateScreenWidth(170.5),
            right: getProportionateScreenWidth(170.5)),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Display'),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
