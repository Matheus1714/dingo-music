import 'dart:html';

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 100, right: 100, top: 50),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    border: Border.all(width: 0.5, color: Colors.red),
                  ),
                  child: Icon(
                    Icons.audiotrack,
                    color: Colors.white,
                    size: 200.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 300.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome do Artista',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome da Música',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Buscar Letra'),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Buscar no YouTube'),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300.0,
                color: Colors.black12,
                child: Container(
                  child: Text(
                      'dddddddddddddddd\nqaqqqqqqqqqqqqqqqqqqqqqqqq\nsssssssssssssssssssssss\nddddddddddddddddddddddd\neeeeeeeeeeeeeeeeeeeeee\ndddddddddddddddddddd\nddddddddddddddddddddd\ndddddddddddddddddddddda\neeeeeeeeeeeeeeeeeeeeeeeeeeeee\nssssssssssssssssssssssssss\nsssssssssssssssssssssss\nsssssssssssssssssss\ndddddddddddddddd\nqaqqqqqqqqqqqqqqqqqqqqqqqq\nsssssssssssssssssssssss\nddddddddddddddddddddddd\neeeeeeeeeeeeeeeeeeeeee\ndddddddddddddddddddd\nddddddddddddddddddddd\ndddddddddddddddddddddda\neeeeeeeeeeeeeeeeeeeeeeeeeeeee\nssssssssssssssssssssssssss\nsssssssssssssssssssssss\nsssssssssssssssssss\ndddddddddddddddd\nqaqqqqqqqqqqqqqqqqqqqqqqqq\nsssssssssssssssssssssss\nddddddddddddddddddddddd\neeeeeeeeeeeeeeeeeeeeee\ndddddddddddddddddddd\nddddddddddddddddddddd\ndddddddddddddddddddddda\neeeeeeeeeeeeeeeeeeeeeeeeeeeee\nssssssssssssssssssssssssss\nsssssssssssssssssssssss\nsssssssssssssssssss'),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
