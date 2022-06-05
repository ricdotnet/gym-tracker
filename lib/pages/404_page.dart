import 'package:flutter/material.dart';
import 'package:gym_tracker/components/drawer_component.dart';

class FourOFourPage extends StatelessWidget {
  const FourOFourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ooops...'),
      ),
      endDrawer: const DrawerComponent(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('The page you tried to access does not exist.'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
