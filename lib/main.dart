import 'package:cashito_app/styles/app_colors.dart';
import 'package:cashito_app/ui/common/controls/fab.dart';
import 'package:cashito_app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Font72',
        buttonTheme: ButtonThemeData(
          buttonColor: Theme.of(context).colorScheme.accentColor,
        ),
        primaryColor: Colors.white,
        primaryColorDark: Colors.grey[200],
        primaryColorLight: Colors.grey[100],
        brightness: Brightness.light,
        canvasColor: Colors.grey[100],
        appBarTheme: AppBarTheme(),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Font72',
        buttonTheme: ButtonThemeData(
          buttonColor: Theme.of(context).colorScheme.accentColor,
        ),
        primaryColor: Colors.black,
        primaryColorDark: Colors.grey[800],
        primaryColorLight: Colors.grey[850],
        brightness: Brightness.dark,
        indicatorColor: Colors.white,
        canvasColor: Colors.black,
        appBarTheme: AppBarTheme(),
      ),
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: MyHomePage(title: 'Cashito App'),
        floatingActionButton: FAB(openPage: OpenTestPage()),
      ),
    );
  }
}
