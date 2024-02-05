import 'package:expense_tracker/widgets/home_page.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 230, 207, 0));

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
      ),
      home: const HomePage(),
    );
  }
}
