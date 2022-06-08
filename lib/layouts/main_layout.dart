import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_tracker/components/drawer_component.dart';

class MainLayout extends StatefulWidget {
  final Widget screen;

  const MainLayout({Key? key, required this.screen}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool _isDrawerOpen = false;

  void _openDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Your personal gym tracker.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            _openDrawer();
          },
          // child: (_isDrawerOpen) ? const Text('x') : const Text('+'),
          child: (_isDrawerOpen)
              ? const Icon(CupertinoIcons.plus, color: Colors.white)
              : const Icon(CupertinoIcons.plus, color: Colors.white),
        ),
      ),
      child: Stack(
        children: <Widget>[
          widget.screen,
          if (_isDrawerOpen) DrawerComponent(isOpen: _isDrawerOpen),
        ],
      ),
    );
  }
}
