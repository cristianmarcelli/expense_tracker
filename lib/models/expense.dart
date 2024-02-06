import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat('d/M/yy');

const uuid = Uuid();

enum Category {
  food,
  home,
  travel,
  leisure,
  work,
  car,
  health,
  education,
  publicTransport,
  taxes,
  coffee,
  breakfast,
  videogames,
  cinema,
  gym,
  other,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.home: Icons.home,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.local_play,
  Category.work: Icons.work,
  Category.car: Icons.car_crash,
  Category.health: Icons.local_hospital,
  Category.education: Icons.school,
  Category.publicTransport: Icons.emoji_transportation,
  Category.taxes: Icons.money_off,
  Category.coffee: Icons.coffee,
  Category.breakfast: Icons.free_breakfast,
  Category.videogames: Icons.videogame_asset,
  Category.cinema: Icons.movie,
  Category.gym: Icons.fitness_center,
  Category.other: Icons.more,
};

const categoryName = {
  Category.food: Text('Alimenti'),
  Category.home: Text('Casa'),
  Category.travel: Text('Viaggi'),
  Category.leisure: Text('Sfizi'),
  Category.work: Text('Lavoro'),
  Category.car: Text('Auto'),
  Category.health: Text('Salute'),
  Category.education: Text('Istruzione'),
  Category.publicTransport: Text('Trasporto'),
  Category.taxes: Text('Tasse'),
  Category.coffee: Text('Caffé'),
  Category.breakfast: Text('Colazione'),
  Category.videogames: Text('Videogiochi'),
  Category.cinema: Text('Cinema'),
  Category.gym: Text('Palestra'),
  Category.other: Text('Altro'),
};

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

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  final Category category;
  final List<Expense> expenses;

  // Per costruire una propria constructor function
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; // sum = sum + expense.amount
    }

    return sum;
  }
}
