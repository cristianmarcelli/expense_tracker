import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<Expanses> createState() {
    return _ExpansesState();
  }
}

class _ExpansesState extends State<Expanses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Hamburger',
        amount: 13.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Pizza',
        amount: 11.00,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Train to Bologna',
        amount: 34.50,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'New laptop',
        amount: 399.00,
        date: DateTime.now(),
        category: Category.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('The chart...'),
          Text('Expenses list...'),
        ],
      ),
    );
  }
}
