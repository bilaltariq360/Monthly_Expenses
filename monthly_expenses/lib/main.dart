import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './main_card.dart';
import './income_summary_card.dart';
import './add_new_expense.dart';
import './expense.dart';
import './expense_inputs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Expense> expenseList = [];

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
          title: const Text(
            'Monthly Expenses',
            style: TextStyle(fontFamily: 'MainFont'),
          ),
        ),
        body:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainCard(),
                      Column(
                        children: [
                          IncomSummaryCard(),
                          GestureDetector(
                            onTap: () {},
                            child: AddNewExpense(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //ExpenseInput(),
                  /*Container(
                    child: ListTile(
                      title: Text('Hello'),
                      subtitle: Text('World'),
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
