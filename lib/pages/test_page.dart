import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool _isLoading = true;

  Future<void> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      setState(() {
        _isLoading = false;
      });
    } else {
      throw Exception('Could not load album.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page...'),
      ),
      body: Column(
        children: <Widget>[
          (_isLoading)
              ? const Text('Loading...')
              : const Text('Hello world from another page.'),
        ],
      ),
    );
  }
}
