import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData(fontFamily: GoogleFonts.poppins().fontFamily);

// colors
  static const Color backgroundColor = Color(0xffE9E9E9);
  static const Color textColor = Color(0xff454545);
  static const Color primaryColor = Color(0xff1DA1F2);
  static const Color secondaryColor = Color(0xffFFC727);

  // animations
  static const String authScreenAnimation =
      'https://assets3.lottiefiles.com/packages/lf20_dxnyiaap.json';
  static const String splashScreenAnimation =
      'https://assets3.lottiefiles.com/packages/lf20_dxnyiaap.json';
}
