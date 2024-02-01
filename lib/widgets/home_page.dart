import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestione spese'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openAddExpenseOverlay(context),
          ),
        ],
        // backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }

  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

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
}
