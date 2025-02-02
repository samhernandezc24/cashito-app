import 'package:cashito_app/core/models/budget.dart';
import 'package:cashito_app/core/models/transaction.dart';
import 'package:cashito_app/ui/common/budget_container.dart';
import 'package:cashito_app/ui/common/controls/fab.dart';
import 'package:cashito_app/ui/common/themed_text.dart';
import 'package:cashito_app/ui/common/transaction_entry.dart';
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
                title: 'Nombre del Presupuesto',
                startDate: DateTime.now(),
                endDate: DateTime.now(),
                period: 'month',
                periodLength: 10,
                color: Color(0x4F6ECA4A),
                total: 500,
                spent: 210,
              ),
            ),
            TransactionEntry(
              openPage: OpenTestPage(),
              transaction: Transaction(
                title: 'Uber',
                date: DateTime.now(),
                amount: 50,
                categoryId: 'id',
                note: 'esta es una transacción',
                tagIds: ['id1', 'id2'],
              ),
            ),
            TransactionEntry(
              openPage: OpenTestPage(),
              transaction: Transaction(
                title: 'Amazon',
                date: DateTime.now(),
                amount: 50,
                categoryId: 'id',
                note: 'esta es una transacción',
                tagIds: ['id1', 'id2'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
