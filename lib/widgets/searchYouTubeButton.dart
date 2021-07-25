import 'package:flutter/material.dart';
import '../colorsDefault.dart';
import '../models/Track.dart';

Widget searchYouTubeButton(String artistName, String musicName) {
  return Container(
    width: 300.0,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: DefaultColors.secondaryVioletColor,
          padding: EdgeInsets.symmetric(vertical: 20),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      onPressed: () => Track.searchYouTube(artistName, musicName),
      child: Text('Buscar no YouTube'),
    ),
  );
}
