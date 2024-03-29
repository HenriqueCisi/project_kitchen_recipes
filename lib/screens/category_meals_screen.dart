import 'package:flutter/material.dart';
import 'package:project_kitchen_recipes/components/meal_item.dart';
import 'package:project_kitchen_recipes/models/category.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  
  const CategoryMealsScreen(this.meals,{super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
        return MealItem(categoryMeals[index]);
      }),
    );
  }
}
