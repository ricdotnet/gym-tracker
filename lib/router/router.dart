import 'package:flutter/material.dart';
import 'package:gym_tracker/main.dart';
import 'package:gym_tracker/pages/404_page.dart';
import 'package:gym_tracker/pages/runs_page.dart';

class AppRouter {
  static dynamic navigate(var settings) {
    var uri = Uri.parse(settings.name);

    if (settings.name == '/') {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments.first == 'runs') {
        return MaterialPageRoute(builder: (_) => const RunsPage());
      }
    }

    return MaterialPageRoute(builder: (_) => const FourOFourPage());
  }
}