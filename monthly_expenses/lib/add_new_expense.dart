import 'package:flutter/material.dart';

class AddNewExpense extends StatelessWidget {
  const AddNewExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: 156,
        height: 130,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 222, 124, 108),
          borderRadius: BorderRadius.circular(20),
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
    );
  }
}
