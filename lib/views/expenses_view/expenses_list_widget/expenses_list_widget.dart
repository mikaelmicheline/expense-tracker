import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/views/expenses_view/expenses_list_widget/expense_item_widget.dart';
import 'package:flutter/material.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        background: Container(
          color: Colors.red,
          margin: const EdgeInsets.all(4),
        ),
        child: ExpenseItemWidget(
          expense: expenses[index],
        ),
      ),
    );
  }
}
