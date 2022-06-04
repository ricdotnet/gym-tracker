import 'package:flutter/material.dart';
import 'package:gym_tracker/components/drawer_component.dart';
import 'package:gym_tracker/pages/test_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Your personal gym tracker.'),
        ),
        endDrawer: const DrawerComponent(),
        body: const HomeScreen(title: 'Home page content...'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TestPage();
                  },
                ),
              );
            },
            child: const Text('Click Me!')),
      ],
    );
  }
}
