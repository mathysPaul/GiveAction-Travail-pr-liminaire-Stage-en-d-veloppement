import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title =
      'GiveAction Travail préliminaire – Stage en développement';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyHomePage(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// This is the private State class that goes with MyHomePage.
class _MyHomePageState extends State<MyHomePage> {
  late String _value;
  late TextEditingController _controller;

  Future<void> _showMyDialog(String value) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('User Input:'),
            content: Text('"$value"'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: _controller,
          onSubmitted: (String value) async {
            _value = value;
          },
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          _showMyDialog(_controller.text);
        },
        child: Text("Display User Input"),
      ),
    );
  }
}
