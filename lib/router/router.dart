import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_tracker/auth/strava_auth.dart';
import 'package:gym_tracker/main.dart';
import 'package:gym_tracker/pages/404_page.dart';
import 'package:gym_tracker/pages/runs_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// TODO: maybe if I want both systems check this page for os and then generate depending on the system?
class AppRouter {
  static dynamic navigate(var settings) {
    var uri = Uri.parse(settings.name);

    if (settings.name == '/') {
      // return MaterialPageRoute(builder: (_) => const HomeScreen());
      return CupertinoPageRoute(builder: (_) => const HomeScreen());
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments.first == 'runs') {
        // return MaterialPageRoute(builder: (_) => RunsPage(dotenv.env['STRAVA_AUTH'].toString()));
        return CupertinoPageRoute(builder: (_) => RunsPage(dotenv.env['STRAVA_AUTH'].toString()));
      }

      if (uri.pathSegments.first == 'login') {
        // return MaterialPageRoute(builder: (_) => const StravaAuth());
        return CupertinoPageRoute(builder: (_) => const StravaAuth());
      }
    }

    // return MaterialPageRoute(builder: (_) => const FourOFourPage());
    return CupertinoPageRoute(builder: (_) => const FourOFourPage());
  }
}