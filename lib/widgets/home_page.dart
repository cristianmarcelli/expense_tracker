import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nessuna spesa registrata',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openAddExpenseOverlay(context),
          ),
        ],
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }

  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Spesa eliminata con successo'),
        action: SnackBarAction(
          label: 'Ripristina spesa',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  final List<Expense> _registeredExpenses = [
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
        title: 'Zelda totk',
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
        title: 'Corso flutter',
        amount: 12.99,
        date: DateTime.now(),
        category: Category.education,
      ),
  ];
}
