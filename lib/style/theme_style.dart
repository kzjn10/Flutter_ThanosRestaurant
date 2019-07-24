import 'package:flutter/material.dart';
import 'package:thanosrestaurant/style/colors.dart';

ThemeData buildPrimaryThemeData(BuildContext context) {
  return Theme.of(context).copyWith(
      primaryColor: kColorPrimary,
      primaryColorDark: kColorPrimaryDark,
      accentColor: kColorAccentColor,
      primaryIconTheme: IconThemeData(
        color: kColorIcon
      ),
      primaryTextTheme: TextTheme(
        title: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
            color: kColorPrimaryText
        ),
        subtitle: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 14.0,
            color: kColorSecondaryText
        ),
        headline: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 30.0,
            fontWeight: FontWeight.w400,
            color: kColorPrimaryText
        ),
        subhead: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: kColorSecondaryText
        ),
        caption: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: kColorPrimaryText
        ),
        display1: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: kColorPrimaryText
        ),
        display2: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 18.0,
            color: Colors.white
        ),
        display3: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 20.0,
            wordSpacing: 3,
            color: kColorPrimaryText
        ),
        display4: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
            color: kColorButtonText
        ),
        overline: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 16.0,
            fontWeight: FontWeight.w100,
            color: kColorButtonText
        ),
        button: TextStyle(
            fontFamily: 'Google sans',
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: kColorButtonText
        ),
      )
  );
}