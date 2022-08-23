import 'package:flutter/material.dart';
import 'package:hackathon_project/presentation/resources/color_manager.dart';
import 'package:hackathon_project/presentation/resources/font_manager.dart';
import 'package:hackathon_project/presentation/resources/styles_manager.dart';
import 'package:hackathon_project/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.primary, //<-- SEE HERE
    ),
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager
        .lightPrimary, //ripple effect color // when cursor focus on it this color appear
    // cardview theme
    scaffoldBackgroundColor: ColorManager.white,
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s0,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorManager.black),
    ),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s14,
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
      ),
    ),

    //       NAME         SIZE  WEIGHT  SPACING
    //       headline1    96.0  light   -1.5
    //       headline2    60.0  light   -0.5
    //       headline3    48.0  regular  0.0
    //       headline4    34.0  regular  0.25
    //       headline5    24.0  regular  0.0
    //       headline6    20.0  medium   0.15
    //       subtitle1    16.0  regular  0.15
    //       subtitle2    14.0  medium   0.1
    //       body1        16.0  regular  0.5   (bodyText1)
    //       body2        14.0  regular  0.25  (bodyText2)
    //       button       14.0  medium   1.25
    //       caption      12.0  regular  0.4
    //       overline     10.0  regular  1.5

    //       text theme
    textTheme: TextTheme(
      displayLarge:
          getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
      displayMedium:
          getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s13),
      headlineLarge:
          getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
      headlineMedium:
          getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
      titleMedium:
          getMediumStyle(color: ColorManager.black, fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(color: ColorManager.grey1),
      bodyMedium: getBoldStyle(color: ColorManager.grey),
      bodySmall: getRegularStyle(color: ColorManager.greyText),
    ),

     inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      fillColor: ColorManager.divider,
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),

      //enabbled border style
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.divider,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused border style
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.divider,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
