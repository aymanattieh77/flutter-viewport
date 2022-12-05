import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    canvasColor: darkGreyClr,
    scaffoldBackgroundColor: darkGreyClr,
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get txtStyle1 {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get txtStyle2 {
  return GoogleFonts.actor(
    textStyle: TextStyle(
      fontSize: 15,
      color: Colors.grey[200],
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get dateStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 24,
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 20,
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 18,
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w400,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      color: Get.isDarkMode ? Colors.white : Colors.black87,
      fontWeight: FontWeight.bold,
    ),
  );
}
