import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'expense.dart';

class TransactionList extends StatelessWidget {
  List<Expense> expenseList = [];

  TransactionList(this.expenseList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 0, 189, 167),
          radius: 25,
          child: Text(
            expenseList[0].expAmount.toString(),
            style: TextStyle(
              color: Color.fromARGB(255, 224, 255, 251),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(expenseList[0].expItem),
        subtitle: Text(
          DateFormat.yMMMMEEEEd().format(expenseList[0].expDate),
        ),
        trailing: Text(DateFormat.jm().format(expenseList[0].expDate)),
      ),
    );
  }
}
