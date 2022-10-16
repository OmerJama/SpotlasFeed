import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsRow extends StatefulWidget {
  const IconsRow({Key? key}) : super(key: key);

  @override
  State<IconsRow> createState() => _IconsRowState();
}

class _IconsRowState extends State<IconsRow> {
  bool likeClicked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/MapBorder.svg",
                    height: getProportionateScreenHeight(24),
                    width: getProportionateScreenWidth(24),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.09928,
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/SpeechBubbleBorder.svg",
                    height: getProportionateScreenHeight(24),
                    width: getProportionateScreenWidth(24),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.09928,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      likeClicked = !likeClicked;
                    });
                  },
                  icon: likeClicked == true
                      ? SvgPicture.asset(
                          "assets/icons/HeartClicked.svg",
                          height: getProportionateScreenHeight(24.08),
                          width: getProportionateScreenWidth(28),
                        )
                      : SvgPicture.asset(
                          "assets/icons/HeartBorder.svg",
                          height: getProportionateScreenHeight(24.08),
                          width: getProportionateScreenWidth(28),
                        )),
              SizedBox(
                width: getProportionateScreenWidth(34.89),
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/PaperPlaneBorder.svg",
                    height: MediaQuery.of(context).size.height * 0.02956,
                    width: MediaQuery.of(context).size.width * 0.09928,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
