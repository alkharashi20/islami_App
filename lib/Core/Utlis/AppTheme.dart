import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy_app/Core/Utlis/AppColors.dart';
class AppTheme{
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
      ),
      elevation: 0,
      color: Colors.transparent
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor
      ),
      bodyMedium:  GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor
      ),
      displayMedium:  GoogleFonts.inter(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor
      ),

    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLightColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.blackColor,
      showSelectedLabels: true,
      unselectedItemColor: AppColors.whiteColor,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 32
      )


    )
  );
  static ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:const AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.whiteColor,
        ),
        elevation: 0,
        color: Colors.transparent
      ),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor
          ),
        bodyMedium:  GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor
        ),
        displayMedium:  GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor
        ),
      ),
      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryDarkColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.yellowColor,
        showSelectedLabels: true,
          unselectedItemColor: AppColors.whiteColor,
          showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 32
        )

      )
  );
}