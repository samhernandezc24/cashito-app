import 'package:cashito_app/core/models/budget.dart';
import 'package:cashito_app/core/models/transaction.dart';
import 'package:cashito_app/styles/app_colors.dart';
import 'package:cashito_app/ui/common/budget_container.dart';
import 'package:cashito_app/ui/common/controls/fab.dart';
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
  final GlobalKey<_HomeAppBarState> _appBarKey = GlobalKey();
  double setTitleHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            backgroundColor: Theme.of(context).colorScheme.accentColor,
            pinned: true,
            expandedHeight: 200.0,
            collapsedHeight: 65,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              title: HomeAppBar(key: _appBarKey, defaultTitle: 'Inicio'),
              background: Container(color: Theme.of(context).canvasColor),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10),
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
          SliverAppBar(
            leading: Container(),
            backgroundColor: Colors.transparent,
            expandedHeight: 65.1,
            collapsedHeight: 65,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (setTitleHeight == 0) {
                  setTitleHeight = constraints.biggest.height;
                }

                print(setTitleHeight);

                if (constraints.biggest.height < setTitleHeight) {
                  // ocurre cuando el título desaparece (desplazamiento hacia abajo)
                  // agregar un retardo para esperar a la disposición de los widgets hijos primero
                  Future.delayed(Duration.zero, () async {
                    _appBarKey.currentState?.changedTitle('Transacciones', 1);
                  });
                } else {
                  // ocurre cuando aparece el título (desplazamiento hacia arriba)
                  Future.delayed(Duration.zero, () async {
                    _appBarKey.currentState?.changedTitle('Inicio', -1);
                  });
                }
                return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                  title: TextFont(
                    text: 'Transacciones',
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            ),
          ),
          SliverStickyHeader(
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key, required this.defaultTitle}) : super(key: key);

  final String defaultTitle;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late String title = '';
  late int direction = -1;

  @override
  void initState() {
    super.initState();
    title = widget.defaultTitle;
  }

  void changedTitle(newTitle, newDirection) {
    setState(() {
      title = newTitle;
      direction = newDirection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final inAnimation = Tween<Offset>(
          begin: Offset(0.0, direction == -1 ? -1 : 1),
          end: Offset(0.0, 0.0),
        ).animate(animation);
        final outAnimation = Tween<Offset>(
          begin: Offset(0.0, direction == -1 ? 1 : -1),
          end: Offset(0.0, 0.0),
        ).animate(animation);

        return ClipRect(
          child: SlideTransition(
            position: child.key == ValueKey(title) ? inAnimation : outAnimation,
            child: child,
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        key: ValueKey(title),
        child: TextFont(
          text: title,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
