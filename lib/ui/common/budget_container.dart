import 'package:cashito_app/core/helpers/globals.dart';
import 'package:cashito_app/core/models/budget.dart';
import 'package:cashito_app/styles/app_colors.dart';
import 'package:cashito_app/ui/common/fade_in.dart';
import 'package:cashito_app/ui/common/themed_text.dart';
import 'package:flutter/material.dart';

class BudgetContainer extends StatelessWidget {
  const BudgetContainer({Key? key, required this.budget}) : super(key: key);

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    Widget? widget = Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: TextFont(
            text: budget.title,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFont(
              text: Globals.convertToMoney(budget.spent),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: TextFont(
                text: ' left of ${Globals.convertToMoney(budget.total)}',
                fontSize: 13,
              ),
            ),
          ],
        ),
        BudgetTimeline(budget: budget),
        SizedBox(height: 14),
        Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: TextFont(
              text: 'You can keep spending 15\$ each day.',
              fontSize: 15,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: budget.color,
            offset: Offset(0, 4.0),
            blurRadius: 15.0,
            spreadRadius: -5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned.fill(child: BudgetBackground(color: budget.color)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 20,
              ),
              child: widget,
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetBackground extends StatelessWidget {
  const BudgetBackground({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.alphaBlend(color, Theme.of(context).colorScheme.white).withAlpha(230),
            Color.alphaBlend(color, Theme.of(context).colorScheme.white).withAlpha(200),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class BudgetTimeline extends StatelessWidget {
  const BudgetTimeline({Key? key, required this.budget}) : super(key: key);

  final Budget budget;
  final double todayPercent = 45;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFont(
          text: budget.startDate.day.toString(),
          fontSize: 12,
        ),
        Expanded(
          child: BudgetProgress(
            color: budget.color,
            percent: budget.getPercent(),
            todayPercent: todayPercent,
          ),
        ),
        TextFont(
          text: budget.endDate.day.toString(),
          fontSize: 12,
        ),
      ],
    );
  }
}

class BudgetProgress extends StatelessWidget {
  const BudgetProgress({
    Key? key,
    required this.color,
    required this.percent,
    required this.todayPercent,
  }) : super(key: key);

  final Color color;
  final double percent;
  final double todayPercent;

  @override
  Widget build(BuildContext context) {
    var percentText = SizedBox(
      height: 22,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 4.3),
          child: TextFont(
            text: '${percent.toInt()}%',
            fontSize: 14,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: darken(color, 0.5),
          ),
          margin: EdgeInsets.symmetric(horizontal: 8),
          height: 20,
        ),
        FadeIn(
          child: TodayIndicator(
            percent: todayPercent,
          ),
        ),
        percent <= 40 ? percentText : Container(),
        // FractionallySizedBox(
        //   heightFactor: 1,
        //   widthFactor: percent / 100,
        //   child: Stack(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(6),
        //           color: Colors.red,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class TodayIndicator extends StatelessWidget {
  const TodayIndicator({Key? key, required this.percent}) : super(key: key);

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset(percent / 100, 0),
      child: SizedBox(
        width: 20,
        height: 39,
        child: OverflowBox(
          maxWidth: 500,
          child: SizedBox(
            width: 38,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(context).colorScheme.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 4, right: 5, left: 5, bottom: 3),
                    child: TextFont(
                      textAlign: TextAlign.center,
                      text: 'Today',
                      fontSize: 9,
                      textColor: Theme.of(context).colorScheme.white,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                    color: Theme.of(context).colorScheme.black.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
