import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expanses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpanse});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpanse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (dirextion) {
          onRemoveExpanse(expenses[index]);
        },
        child: ExpansesItem(
          expenses[index],
        ),
      ),
    );
  }
}
