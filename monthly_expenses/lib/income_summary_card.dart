import 'package:flutter/material.dart';

class IncomSummaryCard extends StatelessWidget {
  const IncomSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: 156,
        height: 130,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 189, 167),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Image.asset('assets/images/summary.png', width: 28),
            ),
            Container(
              child: const Text(
                'Summary',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 224, 255, 251),
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
