import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_tracker/models/run_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RunsPage extends StatefulWidget {
  const RunsPage({Key? key}) : super(key: key);

  @override
  State<RunsPage> createState() => _RunsPageState();
}

class _RunsPageState extends State<RunsPage> {
  bool _isLoading = true;

  // static List<RunModel> _runs = [];
  List<dynamic> _runs = [];

  Future<void> fetchRuns() async {
    final response = await http.get(Uri.parse('https://www.strava.com/api/v3/activities'),
        headers: {'Authorization': 'Bearer ${dotenv.env['STRAVA_AUTH']}'});

    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
        _runs = jsonDecode(response.body);
        // _runs = List.generate(response, (index) => null)
      });
    } else {
      throw Exception('Could not load any runs');
    }
  }

  RunModel _formatRun(dynamic run) {
    return RunModel(run['id'], run['name'], run['distance'], run['type'], run['start_latlng'],
        run['end_latlng']);
  }

  @override
  void initState() {
    super.initState();
    fetchRuns();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Runs!'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('You have done ${_runs.length} activities.'),
          Expanded(
            child: (_isLoading)
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : ListView.builder(
                    itemCount: _runs.isEmpty ? 1 : _runs.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (_runs.isEmpty) {
                        return const Center(
                          child: Text('You have no runs.'),
                        );
                      }
                      return Row(
                        children: <Widget>[
                          Text(_formatRun(_runs[index]).toString()),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
