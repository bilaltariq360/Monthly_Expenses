import 'package:flutter/material.dart';
import './expense_inputs.dart';

class AddNewExpense extends StatelessWidget {
  final Function addNewExpense;
  const AddNewExpense(this.addNewExpense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          width: 165,
          height: 130,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 124, 108),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Image.asset('assets/images/add.png', width: 26),
              ),
              Container(
                child: const Text(
                  'Expense',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 255, 234, 232),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 500,
                child: ExpenseInput(addNewExpense),
              );
            },
          );
        },
      ),
    );
  }
}
