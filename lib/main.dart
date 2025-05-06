import 'package:flutter/material.dart';
import 'package:tictactoe/board.dart';
import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homescreen.routename : (context) => homescreen(),
        board.routename: (context) => board(),
      },
      initialRoute: board.routename,
    );
  }
}