import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
        title: 'flutter course',
        amount: 99.9,
        date: DateTime(2025, 2, 9),
        category: ExpenseCategory.education),
    Expense(
        title: 'surgery',
        amount: 380,
        date: DateTime(2025, 2, 12),
        category: ExpenseCategory.health),
    Expense(
        title: 'water bill',
        amount: 140.62,
        date: DateTime(2025, 2, 14),
        category: ExpenseCategory.house),
    Expense(
        title: 'gas',
        amount: 40,
        date: DateTime(2025, 2, 20),
        category: ExpenseCategory.transportation),
    Expense(
        title: 'family travel',
        amount: 859.4,
        date: DateTime(2025, 2, 21),
        category: ExpenseCategory.leisure),
    Expense(
        title: 'medicines',
        amount: 186.89,
        date: DateTime(2025, 2, 23),
        category: ExpenseCategory.health),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add_sharp),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('chart'),
          Expanded(
            child: ExpensesList(expenses: _expenses),
          ),
        ],
      ),
    );
  }
}
