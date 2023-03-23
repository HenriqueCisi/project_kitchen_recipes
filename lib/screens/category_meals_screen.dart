import 'package:flutter/material.dart';
import 'package:project_kitchen_recipes/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body:  Center(
        child: Text('Receitas por Categoria ${category.id}'),
      ),
    );
  }
}
