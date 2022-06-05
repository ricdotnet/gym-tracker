import 'package:flutter/material.dart';
import 'package:gym_tracker/components/drawer_item_component.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  int _selectedDrawerItem = 0;

  void setSelected(int value) {
    setState(() {
      _selectedDrawerItem = value;
    });
  }

  void navigate() {
    Navigator.pushNamed(context, '/runs');
  }

  bool _isSelected(int value) {
    return _selectedDrawerItem == value;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 50, bottom: 30),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Welcome Ricardo.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Divider(
            thickness: 2,
            indent: 4,
            endIndent: 4,
          ),
          DrawerItemComponent('Runs', 1, _isSelected(1), setSelected, navigate),
          // DrawerItemComponent('Menu One', 1, _isSelected(1), setSelected),
          // DrawerItemComponent('Menu Two', 2, _isSelected(2), setSelected),
          // DrawerItemComponent('Menu Three', 3, _isSelected(3), setSelected),
          // DrawerItemComponent('Menu Four', 4, _isSelected(4), setSelected),
        ],
      ),
    );
  }
}
