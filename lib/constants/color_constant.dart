import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstant{

  static const Color primaryColor = Color(0xFF22577A);
  static const Color greenColor = Color(0xFF299675);
  static const Color secondaryColor = Color(0xFFA19E9E);
  static  LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [const Color(0xFF007F59).withOpacity(0.2), Color(0xFF54BC9D)],
  );

  static  List<Color> subjectColorList = [
    Color(0xFFFF5E5E),
    Color(0xFF65B500),
    Color(0xFFFDCEA3),
    Color(0xFF81A4FF),
    Color(0xFF22577A),
    Color(0xFFDF3E8C),
    Color(0xFFFF9900),
    Color(0xFFBB77FF),
    Color(0xFF17A482),
    Color(0xFFFDCEA3),
    Color(0xFF81A4FF),
    Color(0xFF22577A),
    Color(0xFFDF3E8C),


  ];
}