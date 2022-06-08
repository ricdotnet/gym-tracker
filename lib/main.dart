import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gym_tracker/components/drawer_component.dart';
import 'package:gym_tracker/layouts/main_layout.dart';
import 'package:gym_tracker/pages/home_page.dart';
import 'package:gym_tracker/pages/test_page.dart';
import 'package:gym_tracker/router/router.dart';
import 'package:gym_tracker/services/local_database_service.dart';
import 'dart:math' as math;

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
    return CupertinoApp(
      title: 'Gym Tracker',
      theme: const CupertinoThemeData(
        barBackgroundColor: Color(0xFF383B52),
        scaffoldBackgroundColor: Color(0xFF162030),
        // primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => AppRouter.navigate(settings),
      // home: Scaffold(
      //   appBar: AppBar(
      //     centerTitle: true,
      //     title: const Text('Your personal gym tracker.'),
      //   ),
      //   endDrawer: const DrawerComponent(),
      //   body: const HomeScreen(),
      // ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDrawerOpen = false;

  void _openDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MainLayout(screen: HomePage());
  }
}
