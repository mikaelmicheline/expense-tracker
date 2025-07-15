import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense.dart';
import 'package:flutter/material.dart';

class ExpensesView extends StatefulWidget {
  const ExpensesView({super.key});

  @override
  State<ExpensesView> createState() {
    return _ExpensesViewState();
  }
}

class _ExpensesViewState extends State<ExpensesView> {
  final List<ExpenseModel> _expenses = [
    ExpenseModel(
        title: 'flutter course',
        amount: 99.9,
        date: DateTime(2025, 2, 9),
        category: ExpenseCategory.education),
    ExpenseModel(
        title: 'surgery',
        amount: 380,
        date: DateTime(2025, 2, 12),
        category: ExpenseCategory.health),
    ExpenseModel(
        title: 'water bill',
        amount: 140.62,
        date: DateTime(2025, 2, 14),
        category: ExpenseCategory.house),
    ExpenseModel(
        title: 'gas',
        amount: 40,
        date: DateTime(2025, 2, 20),
        category: ExpenseCategory.transportation),
    ExpenseModel(
        title: 'family travel',
        amount: 859.4,
        date: DateTime(2025, 2, 21),
        category: ExpenseCategory.leisure),
    ExpenseModel(
        title: 'medicines',
        amount: 186.89,
        date: DateTime(2025, 2, 23),
        category: ExpenseCategory.health),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        onSubmitNewExpanse: (newExpense) {
          setState(() {
            _expenses.add(newExpense);
          });
        },
      ),
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
            icon: const Icon(Icons.add_sharp),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(
            child: ExpensesList(expenses: _expenses),
          ),
        ],
      ),
    );
  }
}
