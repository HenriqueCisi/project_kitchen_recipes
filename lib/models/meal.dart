import 'package:project_kitchen_recipes/models/meal_complexity.dart';
import 'package:project_kitchen_recipes/models/meal_cost.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final MealComplexity complexity;
  final MealCost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case MealComplexity.simple:
        return 'Simples';
      case MealComplexity.medium:
        return 'Médio';
      case MealComplexity.difficult:
        return 'Difícil';
      default:
        return '';
    }
  }

  String get costText {
        switch (cost) {
      case MealCost.cheap:
        return 'Barato';
      case MealCost.fair:
        return 'Justo';
      case MealCost.expensive:
        return 'Caro';
      default:
        return '';
    }
  }
}
