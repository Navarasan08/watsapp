import 'package:flutter/material.dart';
import 'package:watsapp/src/config/colors.dart';

class AppTheme {
  static ThemeData appPrimaryTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.accentColor,
    iconTheme: IconThemeData(color: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(foregroundColor: Colors.white)
  );
}
