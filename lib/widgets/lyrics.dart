import 'package:flutter/material.dart';
import '../colorsDefault.dart';


Widget lyrics(String musicName,String artistName, String lyricMusic) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: DefaultColors.secondaryVioletColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              '$musicName',
              style: TextStyle(color: DefaultColors.whiteColor, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '$artistName',
              style: TextStyle(color: DefaultColors.whiteColor, fontSize: 15),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(color: DefaultColors.whiteColor),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '$lyricMusic',
                  style: TextStyle(
                    color: DefaultColors.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }