import 'package:flutter/material.dart';

class Budget {
  Budget({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.period,
    required this.periodLength,
    required this.color,
    required this.total,
    required this.spent,
  });

  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String period; // [month, week, year, days]
  final int periodLength;
  final Color color;
  final double total;
  final double spent;

  double getPercent() {
    return spent / total * 100;
  }
}
