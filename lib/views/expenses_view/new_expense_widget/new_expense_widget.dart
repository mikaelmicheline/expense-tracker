import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewExpenseWidget extends StatefulWidget {
  const NewExpenseWidget({super.key, required this.onSubmitNewExpanse});

  final void Function(ExpenseModel newExpense) onSubmitNewExpanse;

  @override
  State<NewExpenseWidget> createState() {
    return _NewExpenseWidgetState();
  }
}

class _NewExpenseWidgetState extends State<NewExpenseWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  ExpenseCategory _selectedCategory = ExpenseCategory.groceries;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 2, now.month, now.day),
      lastDate: DateTime(now.year + 2, now.month, now.day),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _setSelectedCategory(ExpenseCategory? value) {
    if (value == null) return;
    setState(() {
      _selectedCategory = value;
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submitNewExpense() {
    final title = _titleController.text.trim();
    final titleIsInvalid = title.isEmpty;
    final amount = double.tryParse(_amountController.text);
    final amountIsInvalid = amount == null || amount <= 0;
    final dateIsInvalid = _selectedDate == null;

    if (titleIsInvalid || amountIsInvalid || dateIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure the data entered is valid.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    }

    widget.onSubmitNewExpanse(ExpenseModel(
        title: title,
        amount: double.parse(amount.toStringAsFixed(2)),
        date: _selectedDate!,
        category: _selectedCategory));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 50, 18, 18),
      child: Column(
        children: [
          TextField(
            maxLength: 30,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text('Title')),
            controller: _titleController,
          ),
          DropdownButton(
            value: _selectedCategory,
            isExpanded: true,
            items: ExpenseCategory.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name),
                  ),
                )
                .toList(),
            onChanged: _setSelectedCategory,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Amount'), prefixText: '\$'),
                  controller: _amountController,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month_sharp))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              IconButton(
                onPressed: _cancel,
                icon: const Icon(Icons.cancel_sharp, size: 34),
              ),
              const Spacer(),
              IconButton(
                onPressed: _submitNewExpense,
                icon: const Icon(Icons.save_sharp, size: 34),
              )
            ],
          ),
        ],
      ),
    );
  }
}
