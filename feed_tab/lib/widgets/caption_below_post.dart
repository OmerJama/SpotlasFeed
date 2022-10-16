import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CaptionBelowPost extends StatelessWidget {
  const CaptionBelowPost({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(12),
          right: getProportionateScreenWidth(12)),
      child: Align(
        alignment: Alignment.topLeft,
        child: ReadMoreText(
          postModel.caption.text,
          style: const TextStyle(
              fontFamily: 'SF Pro Display', fontSize: 15, wordSpacing: -0.5),
          trimMode: TrimMode.Line,
          trimLines: 2,
          textAlign: TextAlign.start,
          trimCollapsedText: "more...",
          moreStyle: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xFFC8C8D4)),
          lessStyle: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xFFC8C8D4)),
          trimExpandedText: "less...",
          preDataText: "${postModel.author.username}  ",
          preDataTextStyle: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
