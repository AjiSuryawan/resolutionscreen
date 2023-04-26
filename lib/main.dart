import 'package:flutter/material.dart';
import 'package:resolutionscreen/SquareKotak.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaled Flutter Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SquareKotak(),
    );
  }
}