import 'package:flutter/material.dart';

class AppTheme {

  static const Color PrimaryColor = Color(0xff8d17a4); //primary color for app theme
  static const Color SeconderyColor = Color(0xffffd6f6);//secondary color for app theme
  static const Color offWhiteColor = Color(0xfffff7ff);// off white color for app theme
  static const ColorSwatch  = PrimaryColor;// creating a swatch color for the primary app theme color
  static const Color LightGrey = Color.fromRGBO(238 ,238, 238, 1);
  static const Color IconLightColor = Color(0xfffff7ff);

  static const TextStyle display1 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.4,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.7,
  );

  static final TextStyle heading = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w900,
    fontSize: 24,
    color: Colors.white.withOpacity(0.8),
    letterSpacing: 1.2,
  );

  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w200,
    fontSize: 14,
    color: Colors.white.withOpacity(0.8),
  );
  static final TextStyle description = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black26,
  );
  static final TextStyle ProductDescription = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w200,
    fontSize: 18,
    color: Colors.black87,
  );
}