import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class ImageCircle extends StatelessWidget {
  final LinearGradient linearGradient;
  final String photoUrl;
  String blurhashText;

  ImageCircle({
    required this.linearGradient,
    required this.photoUrl,
    required this.blurhashText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: getProportionateScreenHeight(56),
        width: getProportionateScreenWidth(56),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), gradient: linearGradient),
        child: Padding(
          padding: const EdgeInsets.all(3.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: BlurHash(
              hash: blurhashText,
              image: photoUrl,
            ),
          ),
        ),
      ),
    );
  }
}
