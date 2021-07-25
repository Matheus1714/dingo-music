import 'package:flutter/material.dart';

Widget appName() {
  return Container(
    alignment: Alignment.topCenter,
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        'Dingo Music',
        style: TextStyle(fontSize: 60),
      ),
    ),
  );
}
