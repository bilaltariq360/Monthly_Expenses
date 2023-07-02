import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'expense.dart';

class TransactionList extends StatelessWidget {
  final Expense newEexpense;
  final Function deleteEexpense;

  const TransactionList(this.newEexpense, this.deleteEexpense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        GestureDetector(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: (newEexpense.isPaid)
                  ? const Color.fromARGB(255, 0, 189, 167)
                  : const Color.fromARGB(255, 222, 124, 108),
              radius: 25,
              child: FittedBox(
                child: Text(
                  newEexpense.expAmount.toString(),
                  style: TextStyle(
                    color: (newEexpense.isPaid)
                        ? const Color.fromARGB(255, 224, 255, 251)
                        : const Color.fromARGB(255, 255, 234, 232),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(newEexpense.expItem),
            subtitle: Text(
              DateFormat.yMMMMEEEEd().format(newEexpense.expDate),
            ),
            trailing: Text(
              DateFormat.jm().format(newEexpense.expDate),
            ),
          ),
          onLongPress: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Expense Options'),
                content: const Text('Select an option to perform action'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Align(
                      alignment: Alignment
                          .centerLeft, // Align the buttons to the left side
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 189, 167),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 224, 255, 251),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                deleteEexpense(newEexpense.expId);
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 222, 124, 108),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Delete',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 255, 234, 232),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(32, 33, 50, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: const BorderSide(color: Colors.black),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
