import 'package:flutter/material.dart';

// Profile picture colour constants
const pGradientColourPrimary = Color(0xFFFF0080);
const pGradientColourSecondary = Color(0xFFFF0040);
const blankColour = Color(0xFFFFFFFF);

// Primary text. TextStyle (username, spot name)
const primaryTextStyle = TextStyle(
  shadows: [
    Shadow(
      offset: Offset(0, 1),
      blurRadius: 8,
      color: Color(0xCC000000),
    )
  ],
  fontFamily: 'SF Pro Display',
  fontWeight: FontWeight.w600,
  fontSize: 18,
  color: Color(0xFFFFFFFF),
);

//Secondary text. TextStyle (Full name, type of spot + location)
const secondaryTextStyle = TextStyle(
  shadows: [
    Shadow(
      offset: Offset(0, 1),
      blurRadius: 8,
      color: Color(0xFF000000),
    )
  ],
  fontFamily: 'SF Pro Display',
  fontWeight: FontWeight.w600,
  fontSize: 15,
  color: Color(0xCCFFFFFF),
);

//Assets paths

const optionsAsset = "assets/icons/Options.svg";
const starClickedAsset = "assets/icons/StarClicked.svg";
const starAsset = "assets/icons/StarBorder.svg";

// Days ago text style
const daysAgoTextStyle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color(0xFFE8E8F0));

// Like and favourite button colour

var favouritedColour = Colors.yellow.shade300;
