import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(SreeApp());

class SreeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice Roller",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dice Roller By Sreenivas k"),
        ),
        body: Dice(),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var currentNumber = "images/one.png";
  int score = 0;
  int totalScore = 0;
  var Status = "";

  void roll() {
    if (Status == "You Win the match \n Score is 100") {
      setState(() {
        Status = "";
      });
    } else {
      var random = 1 + Random().nextInt(6);
      print(totalScore);
      setState(() {
        switch (random) {
          case 1:
            currentNumber = "images/one.png";
            score = 1;
            totalScore = totalScore + 1;

            break;
          case 2:
            currentNumber = "images/two.png";
            score = 2;
            totalScore = totalScore + 2;

            break;
          case 3:
            currentNumber = "images/three.png";
            score = 3;
            totalScore = totalScore + 3;

            break;
          case 4:
            currentNumber = "images/four.png";
            score = 4;
            totalScore = totalScore + 4;

            break;
          case 5:
            currentNumber = "images/five.png";
            score = 5;
            totalScore = totalScore + 5;

            break;
          case 6:
            currentNumber = "images/six.png";
            score = 6;
            totalScore = totalScore + 6;

            break;
          default:
        }
        if (totalScore >= 100) {
          Status = "You Win the match \n Score is 100";
          score = 0;
          totalScore = 0;

          // Status = "";
        }
      });
    }
  }

  void reset() {
    setState(() {
      score = 0;
      totalScore = 0;
      Status = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var center = TextAlign.center;
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(125.0),
            child: Center(
              child: Image.asset(currentNumber),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: roll,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Roll me !",
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: FloatingActionButton(
                    onPressed: reset,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
                  child: Text(
                    "You got : $score",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 30, 30),
                  child: Text(
                    "Yout Total Score : $totalScore ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      Status,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ],
        )
      ],
    );
  }
}
