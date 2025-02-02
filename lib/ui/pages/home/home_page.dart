import 'package:cashito_app/core/models/budget.dart';
import 'package:cashito_app/core/models/transaction.dart';
import 'package:cashito_app/ui/common/budget_container.dart';
import 'package:cashito_app/ui/common/charts/pie_chart.dart';
import 'package:cashito_app/ui/common/controls/button.dart';
import 'package:cashito_app/ui/common/controls/fab.dart';
import 'package:cashito_app/ui/common/text_input.dart';
import 'package:cashito_app/ui/common/themed_text.dart';
import 'package:cashito_app/ui/common/transaction_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 100),
                Button(
                  label: 'button',
                  width: 120,
                  height: 40,
                  onTap: () {},
                ),
                SizedBox(height: 100),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    children: [
                      PieChartSample3(),
                      IgnorePointer(
                        child: Center(
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      IgnorePointer(
                        child: Center(
                          child: Container(
                            width: 115,
                            height: 115,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                TextInput(labelText: 'labelText'),
              ],
            ),
          ),
          SliverStickyHeader(
            header: TextHeader(text: 'Inicio'),
            sliver: SliverPadding(
              padding: EdgeInsets.symmetric(),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
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
                  ],
                ),
              ),
            ),
          ),

          SliverStickyHeader(
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeader(text: 'Transacciones'),
                DateDivider(date: DateTime.now()),
              ],
            ),
            sliver: SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return TransactionEntry(
                      openPage: OpenTestPage(),
                      transaction: Transaction(
                        title: 'Uber',
                        date: DateTime.now(),
                        amount: 50,
                        categoryId: 'id',
                        note: 'esta es una transacción',
                        tagIds: ['id1', 'id2'],
                      ),
                    );
                  },
                  childCount: 40,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
                TransactionEntry(
                  openPage: OpenTestPage(),
                  transaction: Transaction(
                    title: 'Netflix',
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
        ],
      ),
    );
  }
}
