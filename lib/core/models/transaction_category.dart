import 'package:flutter/material.dart';

class TransactionCategory {
  TransactionCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
  });
  final String id;
  final String title;
  final String icon;
  final Color color;
}
