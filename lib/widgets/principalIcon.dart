import 'package:flutter/material.dart';
import '../colorsDefault.dart';

Widget principalIcon() {
  return Container(
    decoration: BoxDecoration(
      color: DefaultColors.secondaryVioletColor,
      // borderRadius: BorderRadius.all(Radius.circular(100)),
      shape: BoxShape.circle,
    ),
    height: 200,
    width: 200,
    alignment: Alignment.center,
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/principal_icon.png',
          height: 100,
          width: 100,
        ),
      ),
    ),
  );
}
