import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_tracker/auth/strava_auth.dart';
import 'package:gym_tracker/layouts/main_layout.dart';
import 'package:gym_tracker/main.dart';
import 'package:gym_tracker/pages/404_page.dart';
import 'package:gym_tracker/pages/home_page.dart';
import 'package:gym_tracker/pages/runs_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// TODO: maybe if I want both systems check this page for os and then generate depending on the system?
class AppRouter {
  static var currentPage = '/';

  static dynamic navigate(var settings) {
    var uri = Uri.parse(settings.name);

    if (settings.name == '/') {
      // return MaterialPageRoute(builder: (_) => const HomeScreen());
      currentPage = '/';
      return CupertinoPageRoute(builder: (_) => const MainLayout(screen: HomeScreen()));
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments.first == 'runs') {
        // return MaterialPageRoute(builder: (_) => RunsPage(dotenv.env['STRAVA_AUTH'].toString()));
        currentPage = 'runs';
        return CupertinoPageRoute(builder: (_) => MainLayout(screen: RunsPage(dotenv.env['STRAVA_AUTH'].toString())));
      }

      if (uri.pathSegments.first == 'login') {
        // return MaterialPageRoute(builder: (_) => const StravaAuth());
        currentPage = 'login';
        return CupertinoPageRoute(builder: (_) => const MainLayout(screen: StravaAuth()));
      }
    }

    // return MaterialPageRoute(builder: (_) => const FourOFourPage());
    currentPage = '404';
    return CupertinoPageRoute(builder: (_) => const MainLayout(screen: FourOFourPage()));
  }
}
