import 'package:flutter/material.dart';
import 'package:project_kitchen_recipes/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData ourTheme = ThemeData();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ourTheme.copyWith(
          colorScheme:
              ourTheme.colorScheme.copyWith(primary: Colors.pink),
          textTheme: ourTheme.textTheme.copyWith(
            titleLarge: const TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
            bodyLarge: const TextStyle(
                fontSize: 22, color: Colors.black, fontFamily: 'RobotoCondensed'),
          )),
      home: const CategoriesScreen(),
    );
  }
}