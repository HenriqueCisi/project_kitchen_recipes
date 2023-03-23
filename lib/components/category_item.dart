import 'package:flutter/material.dart';
import 'package:project_kitchen_recipes/models/category.dart';
import 'package:project_kitchen_recipes/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  /*
  * Implements navigation
  * */
  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.CATEGORIES_MEALS, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.primary,
      onTap: () {
        _selectCategory(context);
      },
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(0.2),
                  // category.color.withOpacity(0.5),
                  // category.color.withOpacity(0.8),
                  category.color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
    );
  }
}
