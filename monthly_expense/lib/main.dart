import 'package:flutter/material.dart';
import './main_card.dart';
import './income_summary_card.dart';
import './add_new_expense.dart';
import './expense.dart';
import './transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _initialAmount = 0;
  List<Expense> _expenseList = [];
  bool isPaid = false;

  void _addExpense(String expItem, int expAmount, DateTime dateTime, isPaid) {
    setState(() {
      _expenseList.add(
        Expense(
          expId: DateTime.now().toString(),
          expItem: expItem,
          expAmount: expAmount,
          expDate: dateTime,
          isPaid: isPaid,
        ),
      );
      _initialAmount -= expAmount;
    });
  }

  void _deleteExpense(String dateTime) {
    setState(() {
      for (var i = 0; i < _expenseList.length; i++) {
        if (_expenseList[i].expId == dateTime) {
          _initialAmount += _expenseList[i].expAmount;
          _expenseList.removeAt(i);
          return;
        }
      }
    });
  }

  void _addAmount(int amount) {
    setState(() {
      _initialAmount += amount;
    });
  }

  void _replaceAmount(int amount) {
    setState(() {
      _initialAmount = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF202132,
          <int, Color>{
            50: Color.fromRGBO(21, 19, 50, 0.1),
            100: Color.fromRGBO(21, 19, 50, 0.2),
            200: Color.fromRGBO(21, 19, 50, 0.3),
            300: Color.fromRGBO(21, 19, 50, 0.4),
            400: Color.fromRGBO(21, 19, 50, 0.5),
            500: Color.fromRGBO(21, 19, 50, 0.6),
            600: Color.fromRGBO(21, 19, 50, 0.7),
            700: Color.fromRGBO(21, 19, 50, 0.8),
            800: Color.fromRGBO(21, 19, 50, 0.9),
            900: Color.fromRGBO(21, 19, 50, 1.0),
          },
        ),
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Bilal Tariq',
                  style: TextStyle(
                    fontFamily: 'MainFont',
                    color: Color.fromRGBO(255, 255, 255, 0.802),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/My_Pic.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainCard(_initialAmount, _addAmount, _replaceAmount),
                        Column(
                          children: [
                            const IncomSummaryCard(),
                            AddNewExpense(_addExpense),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ..._expenseList.map((exp) {
                      return TransactionList(exp, _deleteExpense);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
