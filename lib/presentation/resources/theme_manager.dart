import 'package:corewave_app_task/presentation/resources/colors_manager.dart';
import 'package:corewave_app_task/presentation/resources/fonts_manager.dart';
import 'package:corewave_app_task/presentation/resources/styles_manager.dart';
import 'package:corewave_app_task/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData appThemeManager() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primaryYellow,
    primaryColorDark: ColorManager.darkYellow,
    disabledColor: ColorManager.lightGrey, // i.e., for disabled button
    splashColor: ColorManager.primaryYellow,

    // appbar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.white,
      centerTitle: true,
      elevation: AppSizeManager.s4,
      shadowColor: ColorManager.grey,
      iconTheme: const IconThemeData(
        color: ColorManager.black,
        size: AppSizeManager.s30,
      ),
      titleTextStyle: regularTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s16,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      elevation: AppSizeManager.s4,
      selectedItemColor: ColorManager.darkYellow,
      unselectedItemColor: ColorManager.darkGrey,
      showUnselectedLabels: true,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: regularTextStyleManager(color: ColorManager.white),
        backgroundColor: ColorManager.primaryYellow,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeManager.s10)),
        elevation: AppSizeManager.s0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: regularTextStyleManager(color: ColorManager.white),
        backgroundColor: ColorManager.primaryYellow,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeManager.s10)),
        disabledBackgroundColor: ColorManager.white,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleLarge: boldTextStyleManager(
          color: ColorManager.black, fontSize: FontSizeManager.s20),
      titleMedium: mediumTextStyleManager(
          color: ColorManager.black, fontSize: FontSizeManager.s18),
      titleSmall: mediumTextStyleManager(
          color: ColorManager.black, fontSize: FontSizeManager.s14),
      labelSmall: semiBoldUnderlinedTextStyleManager(
        color: ColorManager.primaryYellow,
        fontSize: AppSizeManager.s14,
      ),
      labelMedium: mediumTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s14,
      ),
      labelLarge: boldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s18,
      ),
    ),
  );
}
