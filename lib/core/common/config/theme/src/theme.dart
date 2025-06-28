import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'styles.dart';

class AppThemes {
  AppThemes._internal();

  static final ThemeData lightThemeData = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
          fontFamily: 'Almarai'
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,

        fontFamily: 'Almarai'
      ),
    ),

    useMaterial3: true,
      tabBarTheme: TabBarTheme(
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.primaryColor.withValues(alpha: 0.4)),
      brightness: Brightness.light,
      fontFamily: fontFamily,
      primaryColor: AppColors.primaryColor,
      checkboxTheme: const CheckboxThemeData(
          side: BorderSide(
            color: AppColors.primaryColor,
          )),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: AppColors.primaryGray,
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
       elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
         backgroundColor: AppColors.primaryColor,
         foregroundColor: AppColors.white
       )),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          foregroundColor: AppColors.black,
          //     titleTextStyle: TextStyle(color: AppColors.black),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          color: Colors.transparent),
      // cardTheme: cardTheme,
      dialogTheme: dialogTheme,
      textButtonTheme: TextButtonThemeData(
        style: textButtonStyle,
      ),
      chipTheme: const ChipThemeData(
          deleteIconColor: AppColors.primaryColor,
          selectedColor: AppColors.primaryColor,
          backgroundColor: AppColors.white,
          side: BorderSide(color: AppColors.primaryColor, width: 1.5),
          labelStyle: TextStyle(color: AppColors.primaryColor)),
      // primarySwatch: AppColors.accent as MaterialColor,
      colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryGray,
          primaryContainer: AppColors.white,
          onSecondary: AppColors.primaryColor));

static final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    fontFamily: fontFamily,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      //     titleTextStyle: TextStyle(color: AppColors.white),
      iconTheme: IconThemeData(color: AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    cardTheme: cardTheme,
    dialogTheme: dialogTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
   // elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
    textButtonTheme: TextButtonThemeData(style: textButtonStyle),
    // iconTheme: IconThemeData(
    //   size: kIconSize.r,
    //   color: Colors.white,
    // ),

    // primarySwatch: AppColors.accent as MaterialColor,
    colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        primaryContainer: Colors.grey[700]),
    inputDecorationTheme: inputDecorationThemeDark);
}
