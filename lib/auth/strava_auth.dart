import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_tracker/layouts/main_layout.dart';
import 'package:gym_tracker/pages/runs_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StravaAuth extends StatefulWidget {
  const StravaAuth({Key? key}) : super(key: key);

  @override
  State<StravaAuth> createState() => _StravaAuthState();
}

class _StravaAuthState extends State<StravaAuth> {
  String bearerToken = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> genBearerToken(String authCode) async {
    final queryParams = {
      'client_id': dotenv.env['STRAVA_CLIENT_ID'],
      'client_secret': dotenv.env['STRAVA_CLIENT_SECRET'],
      'code': authCode,
      'grant_type': 'authorization_code',
    };
    Uri authEndpoint = Uri.https('www.strava.com', '/oauth/token', queryParams);
    final response = await http.post(authEndpoint);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      bearerToken = body['access_token'];
    } else {
      debugPrint('something broke....');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          'https://www.strava.com/oauth/authorize?client_id=${dotenv.env['STRAVA_CLIENT_ID']}&redirect_uri=https://ricr.dev&response_type=code&approval_prompt=force&scope=read_all,activity%3Aread_all',
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (_) async {
        Uri callbackUri = Uri.parse(_);
        if (callbackUri.queryParameters.containsKey('code')) {
          String? authCode = callbackUri.queryParameters['code'];
          await genBearerToken(authCode!).then((_) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainLayout(screen: RunsPage(bearerToken));
                  },
                ),
              ));
        }
      },
    );
  }
}
