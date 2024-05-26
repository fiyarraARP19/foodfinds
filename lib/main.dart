import 'package:flutter/material.dart';
import 'package:foodfinds/screens/home_screen.dart';

void main() => runApp(FoodFindsApp());

class FoodFindsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodFinds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
