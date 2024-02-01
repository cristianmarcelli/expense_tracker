import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

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
        title: 'Hamburger',
        amount: 13.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Pizza with friends',
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
    Expense(
        title: 'Netflix subscription',
        amount: 5.99,
        date: DateTime.now(),
        category: Category.leisure),
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
