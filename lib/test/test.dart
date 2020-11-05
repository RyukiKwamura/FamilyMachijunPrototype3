import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST',
      home: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('Main'),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/subpage'),
                child: const Text('Subページへ'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
