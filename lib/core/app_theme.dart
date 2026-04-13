import 'package:flutter/material.dart';
import 'package:spotify/core/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF42C83C),
      brightness: Brightness.light,
    );
    return ThemeData(
      colorScheme: colorScheme,
      inputDecorationTheme:
          InputDecorationThemeData(
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.all(30),
            hintStyle: TextStyle(
              color: colorScheme.outline,
              fontVariations: [
                FontVariation.weight(500),
              ],
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
              borderSide: BorderSide(
                width: 1,
                color: colorScheme.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
              borderSide: BorderSide(
                width: 2,
                color: colorScheme.primary,
              ),
            ),
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: Size.fromHeight(90),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadiusGeometry.circular(30),
          ),
        ),
      ),
      scaffoldBackgroundColor:
          AppColors.lightBackground,
      fontFamily: "Satoshi",
      iconTheme: ThemeData.light().iconTheme
          .copyWith(color: Colors.white),
      elevatedButtonTheme:
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.all(10),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusGeometry.circular(
                      30,
                    ),
              ),
            ),
          ),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    );
    return ThemeData(
      primaryColor: const Color(0xFF42C83C),
      colorScheme: colorScheme,
      inputDecorationTheme:
          InputDecorationThemeData(
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.all(30),
            hintStyle: TextStyle(
              color: colorScheme.outline,
              fontVariations: [
                FontVariation.weight(500),
              ],
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
              borderSide: BorderSide(
                width: 1,
                color: colorScheme.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
              borderSide: BorderSide(
                width: 2,
                color: colorScheme.primary,
              ),
            ),
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: Size.fromHeight(80),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadiusGeometry.circular(30),
          ),
        ),
      ),
      scaffoldBackgroundColor:
          AppColors.darkBackground,
      fontFamily: "Satoshi",
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme:
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusGeometry.circular(
                      30,
                    ),
              ),
            ),
          ),
    );
  }
}
