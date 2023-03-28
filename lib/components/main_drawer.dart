import 'package:flutter/material.dart';
import 'package:project_kitchen_recipes/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label,  Function() onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Colors.amber,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: Text('Vamos cozinhar?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary)),
        ),
        const SizedBox(height: 20),
        _createItem(Icons.restaurant, 'Refeições', () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
        const SizedBox(height: 20),
        _createItem(Icons.settings, 'Configurações', () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)),
      ]),
    );
  }
}
