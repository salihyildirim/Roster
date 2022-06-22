import 'package:flutter/material.dart';

class ColorThemeData with ChangeNotifier {
  ThemeData _greenTheme = ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          .copyWith(secondary: Colors.green),
      appBarTheme: AppBarTheme(color: Colors.green),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.white,
          ),
          subtitle1: TextStyle(color: Colors.white)));
  ThemeData _redTheme = ThemeData(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.red,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
          .copyWith(secondary: Colors.red),
      appBarTheme: AppBarTheme(color: Colors.red),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.white,
          ),
          subtitle1: TextStyle(color: Colors.white)));

  ThemeData _selectedThemeData = ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          .copyWith(secondary: Colors.green),
      appBarTheme: AppBarTheme(color: Colors.green),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.white,
          ),
          subtitle1: TextStyle(color: Colors.white)));

  void switchTheme(bool selected) {
    _selectedThemeData = selected ? _greenTheme : _redTheme;
    notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}
