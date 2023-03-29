import 'package:flutter/material.dart';
import 'package:project_kitchen_recipes/data/dummy_data.dart';
import 'package:project_kitchen_recipes/screens/category_meals_screen.dart';
import 'package:project_kitchen_recipes/screens/favourite_screen.dart';
import 'package:project_kitchen_recipes/screens/meal_detail_screen.dart';
import 'package:project_kitchen_recipes/screens/settings_screen.dart';
import 'package:project_kitchen_recipes/screens/tabs_screen.dart';
import 'package:project_kitchen_recipes/utils/app_routes.dart';

import 'models/meal.dart';
import 'models/settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData ourTheme = ThemeData();

  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filteredMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterVegan = settings.isVegan && !meal.isVegan;

        return !filterGluten &&
            !filterLactose &&
            !filterVegetarian &&
            !filterVegan;
      }).toList();
    });
  }

  void _toogleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ourTheme.copyWith(
          colorScheme: ourTheme.colorScheme.copyWith(primary: Colors.pink),
          textTheme: ourTheme.textTheme.copyWith(
            titleLarge: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
            bodyLarge: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontFamily: 'RobotoCondensed'),
          )),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoryMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (context) =>  MealDetailScreen(_toogleFavorite, _isFavorite),
        AppRoutes.FAVOURITE_MEALS: (context) => FavouriteScreen(_favoriteMeals),
        AppRoutes.SETTINGS: (context) =>
            SettingsScreen(_filteredMeals, settings)
      },
    );
  }
}
