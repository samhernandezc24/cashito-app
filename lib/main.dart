import 'package:cashito_app/ui/common/controls/fab.dart';
import 'package:cashito_app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MyHomePage(title: 'Cashito App'),
        floatingActionButton: FAB(openPage: OpenTestPage()),
      ),
    );
  }
}
