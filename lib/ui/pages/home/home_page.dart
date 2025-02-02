import 'package:cashito_app/core/models/budget.dart';
import 'package:cashito_app/ui/common/budget_container.dart';
import 'package:cashito_app/ui/common/themed_text.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFont(text: 'test'),
            BudgetContainer(
              budget: Budget(
                title: 'Budget Name',
                startDate: DateTime.now(),
                endDate: DateTime.now(),
                period: 'month',
                periodLength: 10,
                color: Color(0x4F6ECA4A),
                total: 500,
                spent: 210,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
