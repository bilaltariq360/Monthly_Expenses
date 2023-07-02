import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainCard extends StatelessWidget {
  final int initialAmount;
  final Function addAmount;
  final Function replaceAmount;
  final addAmt = TextEditingController();
  final replaceAmt = TextEditingController();

  MainCard(this.initialAmount, this.addAmount, this.replaceAmount, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: 200,
          height: 270,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(32, 33, 50, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Current Balance',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'Rs. $initialAmount',
                      style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Select Option'),
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
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(25, 25, 25, 0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(children: [
                                            TextField(
                                              controller: addAmt,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Enter amount to add',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 179, 179, 179),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 179, 179, 179),
                                                  ),
                                                ),
                                                labelStyle: const TextStyle(
                                                  fontFamily: 'Party',
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 126, 126, 126),
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                              style: const TextStyle(
                                                fontFamily: 'Party',
                                                fontSize: 17,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                width: 150,
                                                height: 50,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      side: const BorderSide(
                                                          color: Colors.black),
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
                                                    if (addAmt.text != '' &&
                                                        int.parse(addAmt.text) >
                                                            0) {
                                                      addAmount(
                                                        int.parse(addAmt.text),
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                    }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), // Set the corner radius here
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  child: const Text(
                                                    'Add',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                );
                              },
                            );
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
                            'Add to existing amount',
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
                            Navigator.of(context).pop();
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(25, 25, 25, 0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(children: [
                                            TextField(
                                              controller: addAmt,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Enter amount to replace',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 179, 179, 179),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 179, 179, 179),
                                                  ),
                                                ),
                                                labelStyle: const TextStyle(
                                                  fontFamily: 'Party',
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 126, 126, 126),
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                              style: const TextStyle(
                                                fontFamily: 'Party',
                                                fontSize: 17,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20),
                                                width: 150,
                                                height: 50,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      side: const BorderSide(
                                                          color: Colors.black),
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
                                                    if (addAmt.text != '' &&
                                                        int.parse(addAmt.text) >
                                                            0) {
                                                      replaceAmount(
                                                        int.parse(addAmt.text),
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                    }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), // Set the corner radius here
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  child: const Text(
                                                    'Add',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 222, 124, 108),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Replace with new amount',
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
