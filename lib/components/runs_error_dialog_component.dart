import 'package:flutter/cupertino.dart';

class RunsErrorDialogComponent {
  showDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        barrierLabel: 'Hello world.',
        useRootNavigator: true,
        barrierDismissible: false,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Something went wrong.'),
            content: const Text(
                'We could not fetch your runs.\nTry re-authorizing Strava to fix the problem.'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Return'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          );
        });
  }
}
