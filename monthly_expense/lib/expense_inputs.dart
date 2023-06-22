import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseInput extends StatefulWidget {
  final Function newExpense;

  ExpenseInput(this.newExpense);

  @override
  State<ExpenseInput> createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  final expItem = TextEditingController();

  final expAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 70, 25, 10),
      child: Column(children: [
        TextField(
          controller: expItem,
          decoration: InputDecoration(
            labelText: 'Item Name',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 126, 126, 126),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 126, 126, 126),
              ),
            ),
            labelStyle: const TextStyle(
              fontFamily: 'Party',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 126, 126, 126),
              letterSpacing: 1,
            ),
          ),
          style: const TextStyle(
            fontFamily: 'Party',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: TextField(
            controller: expAmount,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              labelText: 'Item Expense',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 126, 126, 126),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 126, 126, 126),
                ),
              ),
              labelStyle: const TextStyle(
                fontFamily: 'Party',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 126, 126, 126),
                letterSpacing: 1,
              ),
            ),
            style: const TextStyle(
              fontFamily: 'Party',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.black),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (expAmount.text != '' && expItem.text != '') {
                    widget.newExpense(
                      expItem.text,
                      int.parse(expAmount.text),
                    );
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(50), // Set the corner radius here
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
