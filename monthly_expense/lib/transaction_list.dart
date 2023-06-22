import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'expense.dart';

class TransactionList extends StatelessWidget {
  final Expense expenseList;

  TransactionList(this.expenseList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 0, 189, 167),
            radius: 25,
            child: Text(
              expenseList.expAmount.toString(),
              style: const TextStyle(
                color: Color.fromARGB(255, 224, 255, 251),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(expenseList.expItem),
          subtitle: Text(
            DateFormat.yMMMMEEEEd().format(expenseList.expDate),
          ),
          trailing: Text(
            DateFormat.jm().format(expenseList.expDate),
          ),
        ),
      ],
    );
  }
}
