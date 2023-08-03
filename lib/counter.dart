// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int count=0;
  void increment(){
    setState(() {
      count++;
    });
  }

  @override
  void initState() {
    super.initState();
    
    count=count;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'first flutter application',
      home: new Scaffold(
        body: new Center(child: ElevatedButton(onPressed: (){increment();},child: Text("++ $count"),) ,),
      )
      
    );
  }
}