import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseInput extends StatefulWidget {
  final Function newExpense;
  const ExpenseInput(this.newExpense, {super.key});

  @override
  State<ExpenseInput> createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  final expItem = TextEditingController();

  final expAmount = TextEditingController();

  late final expDate;
  bool isPaid = false;

  Future<void> _selectDate() async {
    expDate = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 0, 189, 167),
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.fromLTRB(25, 25, 25, 10),
          child: Column(children: [
            TextField(
              controller: expItem,
              decoration: InputDecoration(
                labelText: 'Item Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 179, 179, 179),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 179, 179, 179),
                  ),
                ),
                labelStyle: const TextStyle(
                  fontFamily: 'Party',
                  fontSize: 17,
                  color: Color.fromARGB(255, 126, 126, 126),
                  letterSpacing: 1,
                ),
              ),
              style: const TextStyle(
                fontFamily: 'Party',
                fontSize: 17,
                letterSpacing: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
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
                      color: Color.fromARGB(255, 179, 179, 179),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 179, 179, 179),
                    ),
                  ),
                  labelStyle: const TextStyle(
                    fontFamily: 'Party',
                    fontSize: 17,
                    color: Color.fromARGB(255, 126, 126, 126),
                    letterSpacing: 1,
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Party',
                  fontSize: 17,
                  letterSpacing: 1,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _selectDate,
                  child: const Text(
                    'Select date',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 126, 126, 126),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                        value: isPaid,
                        onChanged: (bool? value) {
                          setState(() {
                            isPaid = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        'Paid',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 126, 126, 126),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                      if (expAmount.text != '' &&
                          int.parse(expAmount.text) > 0 &&
                          expItem.text != '' &&
                          expDate != null) {
                        widget.newExpense(expItem.text,
                            int.parse(expAmount.text), expDate, isPaid);
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // Set the corner radius here
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
        ),
      ),
    ]);
  }
}
