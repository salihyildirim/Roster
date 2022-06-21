import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_page.dart';
import 'models/items_data.dart';

void main() {
  runApp(ChangeNotifierProvider<ItemData>(
      create: (BuildContext context) => ItemData(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green,
          scaffoldBackgroundColor: Colors.green,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.green),
          appBarTheme: AppBarTheme(color: Colors.green),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline3: TextStyle(
                color: Colors.white,
              ),
              subtitle1: TextStyle(color: Colors.white))),
      home: HomePage(),
    );
  }
}
