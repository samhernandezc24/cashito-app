import 'package:animations/animations.dart';
import 'package:cashito_app/core/helpers/globals.dart';
import 'package:cashito_app/core/models/transaction.dart';
import 'package:cashito_app/core/models/transaction_category.dart';
import 'package:cashito_app/core/models/transaction_tag.dart';
import 'package:cashito_app/styles/app_colors.dart';
import 'package:cashito_app/ui/common/themed_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionEntry extends StatelessWidget {
  TransactionEntry({
    Key? key,
    required this.openPage,
    required this.transaction,
  }) : super(key: key);

  final Widget openPage;
  final Transaction transaction;

  double fabSize = 50;
  TransactionCategory category = Globals.findCategory('id');

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      openBuilder: (BuildContext context, VoidCallback _) {
        return openPage;
      },
      onClosed: () {
        debugPrint('hola');
      }(),
      tappable: false,
      closedShape: const RoundedRectangleBorder(),
      middleColor: Theme.of(context).colorScheme.white,
      transitionDuration: Duration(milliseconds: 500),
      closedElevation: 0.0,
      openColor: Theme.of(context).colorScheme.lightDarkAccent,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return Material(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onTap: () => openContainer(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  children: [
                    CategoryIcon(category: category, size: 50),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          transaction.title == ''
                              ? TagIcon(
                                  tag: TransactionTag(
                                    id: 'test',
                                    title: 'test',
                                    categoryId: 'id',
                                  ),
                                  size: 16,
                                )
                              : TextFont(text: transaction.title),

                          transaction.title == '' && transaction.note != ''
                              ? SizedBox(height: 4)
                              : Container(),

                          transaction.note == ''
                              ? Container()
                              : TextFont(
                                  text: transaction.note,
                                  fontSize: 16,
                                  maxLines: 2,
                                ),

                          transaction.note == ''
                              ? Container()
                              : SizedBox(height: 4),

                          // TODO(samhernandezc24): bucle a través de todas las tags relacionadas con esta entry
                          transaction.title == ''
                              ? Container()
                              : TagIcon(
                                  tag: TransactionTag(
                                    id: 'test',
                                    title: 'test',
                                    categoryId: 'id',
                                  ),
                                  size: 12,
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 5),
                      child: TextFont(
                        text: Globals.convertToMoney(transaction.amount),
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    Key? key,
    required this.category,
    required this.size,
  }) : super(key: key);

  final TransactionCategory category;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: category.color),
      child: Center(
        child: Image(
          image: AssetImage('assets/icons/categories/${category.icon}'),
          width: size * 0.5,
        ),
      ),
    );
  }
}

class TagIcon extends StatelessWidget {
  const TagIcon({Key? key, required this.tag, required this.size}) : super(key: key);

  final TransactionTag tag;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: Theme.of(context).colorScheme.lightDarkAccentHeavy,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 5.5 * size / 14,
          right: 10 * size / 14,
          left: 10 * size / 14,
          bottom: 4 * size / 14,
        ),
        child: TextFont(text: 'Mi Tag', fontSize: size),
      ),
    );
  }
}

class DateDivider extends StatelessWidget {
  const DateDivider({Key? key, required this.date}) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.accentColor,
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: TextFont(
          text: DateFormat.yMMMMEEEEd('en_US').format(date).toString(),
          fontSize: 15,
        ),
      ),
    );
  }
}
