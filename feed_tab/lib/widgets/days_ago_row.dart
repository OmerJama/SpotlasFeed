// ignore_for_file: sized_box_for_whitespace

import 'package:feed_tab/utils/constants.dart';
import 'package:feed_tab/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class DaysAgo extends StatelessWidget {
  final DateTime time;
  const DaysAgo({required this.time, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(12),
          right: getProportionateScreenWidth(12)),
      child: Container(
        height: getProportionateScreenHeight(20),
        width: getProportionateScreenWidth(351),
        child: calculateTimeAgo(time),
      ),
    );
  }

  Widget calculateTimeAgo(DateTime time) {
    return Text(
      timeago.format(time, allowFromNow: true),
      style: daysAgoTextStyle,
    );
  }
}
