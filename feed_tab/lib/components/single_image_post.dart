import 'package:feed_tab/utils/constants.dart';
import 'package:feed_tab/utils/media_query.dart';
import 'package:feed_tab/widgets/end_icon.dart';
import 'package:feed_tab/widgets/favourite_button.dart';
import 'package:feed_tab/widgets/primary_name_display.dart';
import 'package:feed_tab/model/post_model.dart';
import 'package:feed_tab/widgets/caption_below_post.dart';
import 'package:feed_tab/widgets/days_ago_row.dart';
import 'package:feed_tab/widgets/icons_row.dart';
import 'package:feed_tab/widgets/image_circle.dart';
import 'package:feed_tab/widgets/secondary_name_display.dart';
import 'package:feed_tab/widgets/tags_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleImagePost extends StatelessWidget {
  const SingleImagePost({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: getProportionateScreenHeight(468),
              width: ScreenSize.screenWidth,
              child: BlurHash(
                hash: postModel.media.first.blurHash!,
                image: postModel.media.first.url,
              ),
            ),
            Row(
              children: [
                ImageCircle(
                    blurhashText: postModel.spot.logo.blurHash!,
                    linearGradient: const LinearGradient(colors: [
                      pGradientColourPrimary,
                      pGradientColourSecondary,
                    ]),
                    photoUrl: postModel.author.photoUrl),
                Column(
                  children: [
                    PrimaryNameDisplay(text: postModel.author.username),
                    SizedBox(
                      height: getProportionateScreenHeight(2),
                      width: getProportionateScreenWidth(235),
                    ),
                    SecondaryNameDisplay(text: postModel.author.fullName),
                  ],
                ),
                SizedBox(
                  width: getProportionateScreenWidth(12),
                ),
                const EndIcon(assetName: optionsAsset),
              ],
            ),
            // To make sure this widget is positioned bottom left
            Positioned(
              bottom: 0,
              left: 0,
              child: Row(
                children: [
                  ImageCircle(
                      blurhashText: postModel.spot.logo.blurHash!,
                      linearGradient: const LinearGradient(colors: [
                        blankColour,
                        blankColour,
                      ]),
                      photoUrl: postModel.spot.logo.url),
                  Column(
                    children: [
                      PrimaryNameDisplay(text: postModel.spot.name),
                      SizedBox(
                        height: getProportionateScreenHeight(2),
                        width: getProportionateScreenWidth(235),
                      ),
                      // missing location, when available used postModel to access
                      SecondaryNameDisplay(
                          text: "${postModel.spot.types.first.name} • "),
                    ],
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(12),
                  ),
                  const FavouiteButton(),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(16),
          width: getProportionateScreenWidth(279),
        ),
        const IconsRow(),
        SizedBox(
            height: getProportionateScreenHeight(16),
            width: getProportionateScreenWidth(351)),
        CaptionBelowPost(postModel: postModel),
        SizedBox(
          height: getProportionateScreenHeight(8),
          width: getProportionateScreenWidth(351),
        ),
        const TagsRow(),
        SizedBox(height: getProportionateScreenHeight(12)),
        DaysAgo(time: postModel.createdAt),
        SizedBox(
          height: getProportionateScreenHeight(24),
          width: getProportionateScreenWidth(351),
        ),
      ],
    );
  }
}
