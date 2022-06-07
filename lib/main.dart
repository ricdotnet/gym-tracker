import 'package:flutter/cupertino.dart';
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Your personam gym tracker.',
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
              ? const Icon(CupertinoIcons.xmark, color: Colors.white)
              : const Icon(CupertinoIcons.plus, color: Colors.white),
        ),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            top: (_isDrawerOpen)
                ? MediaQuery.of(context).size.height / 2
                : MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color(0xFF383B52),
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
