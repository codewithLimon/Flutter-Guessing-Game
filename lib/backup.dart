// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var chances;
  var number;
  String statement = '';

  int count = 0; // to change the generate button into reset button;
  var isGenerated;
  @override
  void initState() {
    super.initState();
    statement =
        'Click the `Generate the Number` button to generate a random number between 1-3 and select the box wisely to win. The boxes are indexed from 1 to 3.';
    btnText = 'Generate the number';
    isGenerated=false;
    chances=2;
    isLost=false;
  }

  String btnText = '';
  var isLost;
  

  void generate() {
    count++;

    if (count == 1) {
      setState(() {
        statement =
            "The number has been generated, now please choose the circle!";
            btnText='Reset Game';
      });

      var random = Random();
      number = random.nextInt(3) + 1;

      isGenerated = true;
    } else {
      setState(() {
        btnText='Generate the number';
        count=0;
        isGenerated=false;
        isLost=false;
        chances=2;
        statement =
        'Click the `Generate the Number` button to generate a random number between 1-3 and select the box wisely to win. The boxes are indexed from 1 to 3.';
      });

      count=0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Guessing Game',
      home: Scaffold(
        body: Container(
            color: Color.fromARGB(255, 41, 41, 41),
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(children: [
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chances left: $chances',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GInter',
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              generate();
                            },
                            style: buttonPrimary,
                            child: Text(
                              '$btnText',
                              style:
                                  TextStyle(fontFamily: 'GInter', fontSize: 16),
                            ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    SizedBox(
                      // color: Colors.red,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.0),
                              child: Text(
                                '$statement',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    ElevatedButton(
                      onPressed: isGenerated && !isLost
                          ? () {
                              //circle1
                              if(number==1 && chances>0){
                                setState(() {
                                  statement='You won!';
                                });
                              }else {chances--;
                              setState(() {
                                var x=chances;
                                chances=x;
                              });
                              }

                              if(chances<1){
                                isLost=true;
                                setState(() {
                                  statement='You lost!';
                                  isLost=true;
                                });
                              }
                            }
                          : null,
                      child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'GInter',
                            fontWeight: FontWeight.bold),
                      ),
                      style: buttonCircleBlue,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    ElevatedButton(
                      onPressed: isGenerated && !isLost
                          ? () {
                              //circle2
                              if(number==2 && chances>0){
                                setState(() {
                                  statement='You won';
                                });
                              }else{
                                chances--;
                                setState(() {
                                var x=chances;
                                chances=x;
                              });
                              }

                              if(chances<1){
                                isLost=true;
                                setState(() {
                                  isLost=true;
                                  statement='You lost!';
                                });
                              }
                            }
                          : null,
                      child: Text(
                        '2',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'GInter',
                            fontWeight: FontWeight.bold),
                      ),
                      style: buttonCircleBlue,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    ElevatedButton(
                      onPressed: isGenerated && !isLost
                          ? () {
                              //circle3

                              if(number==3 && chances>0){
                                setState(() {
                                  statement='You won';
                                });
                              }else {
                                chances--;
                                setState(() {
                                var x=chances;
                                chances=x;
                              });
                              }

                              if(chances<1){
                                isLost=true;
                                setState(() {
                                  isLost=true;
                                  statement='You lost!';
                                });
                              }
                              
                            }
                          : null,
                      child: Text(
                        '3',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'GInter',
                            fontWeight: FontWeight.bold),
                      ),
                      style: buttonCircleBlue,
                    ),
                  ],
                )),
                Container(
                  color: Color.fromARGB(
                      255, 63, 63, 63), // Replace with your desired color
                  width: double
                      .infinity, // The container width takes up the full screen width
                  height: 50, // Replace with your desired height
                  child: Center(
                    child: Text(
                      'Made by Limon with 💕',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'GInter'),
                    ),
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}
