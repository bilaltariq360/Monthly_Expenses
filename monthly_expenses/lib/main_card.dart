import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: 200,
        height: 270,
        decoration: BoxDecoration(
          color: Color.fromRGBO(32, 33, 50, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/My_Pic.png'),
                ),
                const Text(
                  'Bilal Tariq',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(255, 255, 255, 0.802),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  '🪙 ' + '54900',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
    );
  }
}
