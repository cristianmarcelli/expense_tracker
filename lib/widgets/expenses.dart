import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Assicurazione auto',
      amount: 599.00,
      date: DateTime.now(),
      category: Category.car,
    ),
    Expense(
      title: 'Pizza con amici',
      amount: 11.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Treno per Bologna',
      amount: 34.50,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Laptop nuovo',
      amount: 399.00,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Abbonamento Netflix',
      amount: 5.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'God of War PS5',
      amount: 49.99,
      date: DateTime.now(),
      category: Category.videogames,
    ),
    Expense(
      title: 'Zelda Totk',
      amount: 59.99,
      date: DateTime.now(),
      category: Category.videogames,
    ),
    Expense(
      title: 'Analisi del sangue',
      amount: 6.00,
      date: DateTime.now(),
      category: Category.health,
    ),
    Expense(
      title: 'Hellblade su steam',
      amount: 2.48,
      date: DateTime.now(),
      category: Category.videogames,
    ),
    Expense(
      title: 'Corso flutter',
      amount: 12.99,
      date: DateTime.now(),
      category: Category.education,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpense),
          ),
        ],
      ),
    ));
  }
}
