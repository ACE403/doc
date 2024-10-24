import 'package:brezie/utils/theme/custom_themes/appbar_theme.dart';
import 'package:brezie/utils/theme/custom_themes/bottomsheet_theme.dart';
import 'package:brezie/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:brezie/utils/theme/custom_themes/chip_theme.dart';
import 'package:brezie/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:brezie/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:brezie/utils/theme/custom_themes/text_field_theme.dart';
import 'package:brezie/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TappTheme {
  TappTheme._();
  static final ThemeData lightTheme = ThemeData(
      // useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      chipTheme: TChipTheme.LightChipTheme,
      appBarTheme: TAppBarTheme.LightAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.LightBottomSheetTheme,
      checkboxTheme: TCheckboxTheme.LightCheckboxTheme,
      outlinedButtonTheme: TOutLinedButtonTheme.LightOutLinedButtonTheme,
      canvasColor: Colors.white,
      dialogBackgroundColor: Colors.white,
      popupMenuTheme: PopupMenuThemeData(color: Colors.white),
      inputDecorationTheme: TTextFormFieldTheme.LightInputDecorationTheme);

  static final ThemeData darktheme = ThemeData(
      canvasColor: Colors.white,
      // useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      dialogBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      chipTheme: TChipTheme.LightChipTheme,
      appBarTheme: TAppBarTheme.LightAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.LightBottomSheetTheme,
      checkboxTheme: TCheckboxTheme.LightCheckboxTheme,
      outlinedButtonTheme: TOutLinedButtonTheme.LightOutLinedButtonTheme,
      popupMenuTheme: PopupMenuThemeData(color: Colors.white),
      inputDecorationTheme: TTextFormFieldTheme.LightInputDecorationTheme);
}
