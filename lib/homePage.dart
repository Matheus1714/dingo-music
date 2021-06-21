import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          alignment: Alignment.topCenter,
          child: Text(
            'Dingo Music',
            style: TextStyle(fontSize: 60),
          ),
        ),
      ),
    );
  }
}
