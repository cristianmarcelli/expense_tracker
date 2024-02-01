import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  // : id = uuid.v4(); -- In questo modo si genera un ID univoco e lo si assegna come valore iniziale alla proprietà ID
  // ogni volta che la classe Expense viene inizializzata

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
