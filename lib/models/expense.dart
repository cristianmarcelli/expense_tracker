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
  movie,
  gym,
  other,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
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
  Category.movie: Icons.movie,
  Category.gym: Icons.fitness_center,
  Category.other: Icons.more,
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
