import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dice1Image = "assets/dice1.png";
  String dice2Image = "assets/dice1.png";
  int rollCount = 0;
  int score = 0;
  static const int MAX_ROLLS = 10;

  void rollDice() {
    if (rollCount < MAX_ROLLS) {
      int randomNumber = Random().nextInt(6) + 1;
      int randomNumber2 = Random().nextInt(6) + 1;
      setState(() {
        dice1Image = "assets/dice$randomNumber.png";
        dice2Image = "assets/dice$randomNumber2.png";
        rollCount++;
        if (randomNumber == 1 && randomNumber2 == 1 ||
            randomNumber == 6 && randomNumber2 == 6) {
          score += 10;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 40),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Dice Roll Project"),
          centerTitle: true,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Score: $score",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                dice1Image,
                height: 120,
                width: 120,
              ),
              Image.asset(
                dice2Image,
                height: 120,
                width: 120,
              )
            ],
          ),
          ElevatedButton(
            onPressed: rollCount < MAX_ROLLS ? rollDice : null,
            child: Text(
              "Roll Dice",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
