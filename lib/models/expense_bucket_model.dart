import 'package:expense_tracker/models/expense_model.dart';

class ExpenseBucketModel {
  const ExpenseBucketModel({required this.category, required this.expenses});

  ExpenseBucketModel.forCategory(
      {required List<ExpenseModel> allExpenses, required this.category})
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final ExpenseCategory category;
  final List<ExpenseModel> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
