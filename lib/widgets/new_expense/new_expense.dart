import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _saveExpense() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          TextField(
            maxLength: 30,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text('Title')),
            controller: _titleController,
          ),
          Row(
            children: [
              IconButton(
                onPressed: _saveExpense,
                icon: Icon(Icons.save_sharp),
              )
            ],
          ),
        ],
      ),
    );
  }
}
