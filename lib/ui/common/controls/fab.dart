import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FAB extends StatelessWidget {
  FAB({Key? key, required this.openPage}) : super(key: key);

  final Widget openPage;

  double fabSize = 50;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (BuildContext context, VoidCallback _) {
        return openPage;
      },
      closedElevation: 6.0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(fabSize / 2),
        ),
      ),
      closedColor: Theme.of(context).colorScheme.secondary,
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return InkWell(
          onTap: () => openContainer(),
          child: SizedBox(
            height: fabSize,
            width: fabSize,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        );
      },
    );
  }
}

class OpenTestPage extends StatelessWidget {
  const OpenTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test page')),
      body: Container(),
    );
  }
}
