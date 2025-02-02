import 'package:cashito_app/core/models/transaction_category.dart';
import 'package:flutter/material.dart';

List<TransactionCategory> defaultCategories() {
  return [
    TransactionCategory(
      id: 'id',
      title: 'Comidas',
      icon: 'cutlery.png',
      color: Colors.blueGrey,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Despensas',
      icon: 'greoceries.png',
      color: Colors.green,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Compras',
      icon: 'shopping.png',
      color: Colors.pink,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Transporte',
      icon: 'tram.png',
      color: Colors.yellow,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Entretenimiento',
      icon: 'popcorn.png',
      color: Colors.blue,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Facturas & Pagos',
      icon: 'bills.png',
      color: Colors.green,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Educación',
      icon: 'graduation.png',
      color: Colors.purple,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Regalos',
      icon: 'gift.png',
      color: Colors.red,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Deportes',
      icon: 'sports.png',
      color: Colors.cyan,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Trabajo',
      icon: 'briefcase.png',
      color: Colors.brown,
    ),
    TransactionCategory(
      id: 'id',
      title: 'Viajes',
      icon: 'plane.png',
      color: Colors.orange,
    ),
  ];
}
