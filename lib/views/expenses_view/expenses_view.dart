import 'package:expense_tracker/views/expenses_view/expenses_list_widget/expenses_list_widget.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/views/expenses_view/new_expense_widget/new_expense_widget.dart';
import 'package:expense_tracker/views/expenses_view/total_amount_widget/total_amount_widget.dart';
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
        amount: 199.9,
        date: DateTime(2025, 2, 9),
        category: ExpenseCategory.education),
    ExpenseModel(
        title: 'gas',
        amount: 40,
        date: DateTime(2025, 2, 10),
        category: ExpenseCategory.transportation),
    ExpenseModel(
        title: 'family travel',
        amount: 859.4,
        date: DateTime(2025, 2, 14),
        category: ExpenseCategory.leisure),
    ExpenseModel(
        title: 'water bill',
        amount: 147.62,
        date: DateTime(2025, 2, 23),
        category: ExpenseCategory.house),
    ExpenseModel(
        title: 'medicines',
        amount: 186.89,
        date: DateTime(2025, 2, 25),
        category: ExpenseCategory.health),
  ];

  double _totalAmount = 0;

  @override
  void initState() {
    calculateTotalAmount();
    super.initState();
  }

  void calculateTotalAmount() {
    _totalAmount =
        _expenses.fold(0, (value, element) => value += element.amount);
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpenseWidget(
        onSubmitNewExpanse: (newExpense) {
          setState(() {
            _expenses.add(newExpense);
            _expenses.sort((a, b) => a.date.compareTo(b.date));
            calculateTotalAmount();
          });
        },
      ),
    );
  }

  void removeExpense(ExpenseModel expense) {
    final index = _expenses.indexOf(expense);

    setState(() {
      _expenses.remove(expense);
      calculateTotalAmount();
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _expenses.insert(index, expense);
                calculateTotalAmount();
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('Start adding your expenses!'),
    );

    if (_expenses.isNotEmpty) {
      mainContent = ExpensesListWidget(
        expenses: _expenses,
        onRemoveExpense: removeExpense,
      );
    }

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
          const SizedBox(
            height: 40,
          ),
          TotalAmountWidget(
            totalAmount: _totalAmount,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
