import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gym_tracker/components/drawer_component.dart';
import 'package:gym_tracker/pages/test_page.dart';
import 'package:gym_tracker/router/router.dart';
import 'package:gym_tracker/services/local_database_service.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await LocalDatabaseService().init();
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
      onGenerateRoute: (settings) => AppRouter.navigate(settings),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Your personal gym tracker.'),
        ),
        endDrawer: const DrawerComponent(),
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('hello world'),
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
