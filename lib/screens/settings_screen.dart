import 'package:flutter/material.dart';
import 'package:project_kitchen_recipes/components/main_drawer.dart';
import 'package:project_kitchen_recipes/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings newSettings;

  const SettingsScreen(this.onSettingsChanged,this.newSettings,{super.key});


  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.newSettings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value){
          onChanged(value);
          widget.onSettingsChanged(settings);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                    'Sem Gluten',
                    'Só exibe refeições sem gluten',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value)),
                _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value)),
                _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value)),
                _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value)),
              ],
            ))
          ],
        ));
  }
}
