import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: 200,
        height: 270,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(32, 33, 50, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Current Balance',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                Text(
                  'Rs. 50,000',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ),
    );
  }
}
