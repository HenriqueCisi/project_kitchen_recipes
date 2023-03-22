
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData ourTheme = ThemeData();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ourTheme.copyWith(
          colorScheme: ourTheme.colorScheme.copyWith(
              primary:  Colors.amber.shade800),
          textTheme: ourTheme.textTheme.copyWith(
              titleLarge:
                   const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Vamos Cozinhar?',
              style: Theme.of(context).textTheme.titleLarge)),
      body: const Center(child: Text('Navegar é preciso')),
    );
  }
}

