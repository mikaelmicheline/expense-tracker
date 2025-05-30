import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final dateFormatter = DateFormat.yMd();

enum ExpenseCategory {
  groceries,
  health,
  transportation,
  house,
  education,
  utilities,
  leisure,
}

const categoryIcons = {
  ExpenseCategory.groceries: Icons.shopping_cart_sharp,
  ExpenseCategory.health: Icons.medication_sharp,
  ExpenseCategory.transportation: Icons.motorcycle_sharp,
  ExpenseCategory.house: Icons.house_sharp,
  ExpenseCategory.education: Icons.book_sharp,
  ExpenseCategory.utilities: Icons.wifi_sharp,
  ExpenseCategory.leisure: Icons.beach_access_sharp
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formattedDate {
    return dateFormatter.format(date);
  }
}
