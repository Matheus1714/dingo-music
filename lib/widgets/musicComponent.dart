import 'package:flutter/material.dart';
import 'loadingPage.dart';
import 'lyrics.dart';

Widget musicComponent(
    initialState, findingMusic, musicName, artistName, lyricMusic) {
  if (initialState) {
    return Container(
      width: 300,
      child: Text('A letra da sua música será colocada aqui.'),
    );
  } else {
    if (findingMusic) {
      return loading();
    } else {
      return lyrics(musicName, artistName, lyricMusic);
    }
  }
}
