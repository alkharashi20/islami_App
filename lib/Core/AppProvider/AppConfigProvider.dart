import 'package:flutter/material.dart';
import 'package:islamy_app/Core/Utlis/AppAssets.dart';

class AppConfigProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) {
      return;
    }
    currentLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) {
      return;
    }
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }

  String getBackgroundImage() {
    return isDarkMode()
        ? ImageAssets.background_dark_view
        : ImageAssets.background_view;
  }
}
