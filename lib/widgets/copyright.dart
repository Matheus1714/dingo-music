import 'package:flutter/material.dart';
import '../colorsDefault.dart';

Widget copyright() {
  return Container(
    width: 300,
    height: 50,
    decoration: BoxDecoration(
      color: DefaultColors.secondaryVioletColor,
    ),
    alignment: Alignment.center,
    child: Text(
      '@copyright Dingo Music',
      style: TextStyle(
          color: DefaultColors.whiteColor,
          fontSize: 15,
          fontWeight: FontWeight.bold),
    ),
  );
}
