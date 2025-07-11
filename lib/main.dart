import 'package:expense_tracker/widgets/expenses_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ExpensesView(),
    ),
  );
}
