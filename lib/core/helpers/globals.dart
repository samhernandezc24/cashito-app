import 'package:cashito_app/core/models/transaction_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Globals {
  Globals._();

  static String convertToMoney(double amount) {
    String currencyType = '\$';
    final currency = NumberFormat('#,##0.00', 'es_MX');
    String formatOutput = currency.format(amount);

    if (formatOutput.substring(formatOutput.length - 2) == '00') {
      return currencyType +
          formatOutput.replaceRange(
            formatOutput.length - 3,
            formatOutput.length,
            '',
          );
    }

    return currencyType + currency.format(amount);
  }

  static TransactionCategory findCategory(String id) {
    return TransactionCategory(
      id: 'id',
      title: 'Food and Drink',
      icon: 'cutlery.png',
      color: Colors.orange,
    );
  }
}
