import 'package:flutter/material.dart';
import 'package:project_kitchen_recipes/components/meal_item.dart';

import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavouriteScreen(this.favoriteMeals,{super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Vazio'),
      );
    }
    else{
     return Center(
      child: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(favoriteMeals[index]);
        })
    );
    }
  }
}