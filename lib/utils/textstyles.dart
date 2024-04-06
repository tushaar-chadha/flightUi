import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyle(Color textColor, double fontSize, FontWeight FontWeight) {
  return GoogleFonts.montserrat(
      color: textColor, fontSize: fontSize, fontWeight: FontWeight);
}

TextStyle poppinStyleHeight(
    Color textColor, double fontSize, FontWeight fontWeight, double height) {
  return GoogleFonts.montserrat(
      height: height,
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

