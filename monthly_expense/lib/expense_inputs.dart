import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ExpenseInput extends StatefulWidget {
  final Function newExpense;
  const ExpenseInput(this.newExpense, {Key? key}) : super(key: key);

  @override
  State<ExpenseInput> createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  final expItem = TextEditingController();
  final expAmount = TextEditingController();
  DateTime? expDate;
  bool isPaid = false;

  Future<void> _selectDate() async {
    final selectedDate = await showDatePicker(
      initialDate: expDate ?? DateTime.now(),
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

    if (selectedDate != null) {
      setState(() {
        expDate = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          DateTime.now().hour,
          DateTime.now().minute,
          DateTime.now().second,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return Container(
      margin: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
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
                      child: Text(
                        expDate != null
                            ? DateFormat.yMMMMEEEEd().format(expDate!)
                            : DateFormat.yMMMMEEEEd().format(now),
                        style: const TextStyle(
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
              ],
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
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
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (expAmount.text.isNotEmpty &&
                          int.parse(expAmount.text) > 0 &&
                          expItem.text.isNotEmpty) {
                        widget.newExpense(
                          expItem.text,
                          int.parse(expAmount.text),
                          (expDate == null) ? DateTime.now() : expDate,
                          isPaid,
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
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
            ),
          ),
        ],
      ),
    );
  }
}
