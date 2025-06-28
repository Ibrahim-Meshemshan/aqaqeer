import 'package:flutter/material.dart';

class
AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const primaryColor = Color(0xffA676AD);
  static const primaryGray = Color(0xffefefef);
  static const primaryGray2 = Color(0xffefefef);
  static const fourthColor = Color(0xff03789D);
  static const secondaryColor = Color(0xfffdddc3);
  static const lightSecondaryColor = Color(0xff95D54B);
  static const hintTextColor = Color(0xffB2B2B2);

  static const white = Colors.white;
  static const black = Colors.black;
  static const purple = Color(0xff894993);
  static const lightPurple = Color(0xffA676AD);
  static const lightPurple2 = Color(0xffe2d1e4);
  static const darkGreen = Color(0xff418D66);
  static const gray = Color(0xff4E4E4E);
  static const lightGray = Color(0xffF6F7FB);
  static const transparent = Colors.transparent;

  static const Color mainColor =Color(0xfff78f36);
  static const Color blueBackground = Color(0xff7FB640);
  static const Color linkedinButBackground = Color(0xff95D54B);
  static const Color linkedinButBorder = Color(0xff0A66C2);
  static const Color mainRed = Color(0xffBB2F13);
  static const Color lightRed = Color(0xffffdefb);
  static const Color mainGray = Color(0xff707070);
  static const Color lightGrey = Color(0xffE3E3E3);
  static const Color chartGray = Color(0xff979797);
  static const Color mainOrange = Color(0xffEBAC2D);
  static const Color darkOrange = Color(0xffFDA12C);
  static const Color mainYellow = Color(0xffFDC71F);
  static const Color mainGreen = Color(0xff00CE30);
  static const Color secondaryGreen = Color(0xff39A95E);
  static const Color indicatorBGColor = Color(0xffE1E5EB);

  static const Color scaffoldBGColor = Color(0xffF6F7FA);
  static const Color appBarBGColor = Color(0xffF6F7FA);

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


}
