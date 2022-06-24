import 'package:flutter/material.dart';
import 'package:getitdonee/models/color_theme_data.dart';
import 'package:provider/provider.dart';

import './screens/home_page.dart';
import 'models/items_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(
      create: (BuildContext context) => ItemData(),
    ),
    ChangeNotifierProvider<ColorThemeData>(
      create: (context) => ColorThemeData(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ColorThemeData>(context).selectedThemeData,
      home: HomePage(),
    );
  }
}

ThemeData greenTheme = ThemeData(
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
ThemeData redTheme = ThemeData(
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
