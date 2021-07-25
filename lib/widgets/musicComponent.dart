import 'package:flutter/material.dart';
import 'loadingPage.dart';
import 'lyrics.dart';

Widget musicComponent(
    initialState, findingMusic, musicName, artistName, lyricMusic) {
  if (initialState) {
    return Container();
  } else {
    if (findingMusic) {
      return loading();
    } else {
      return lyrics(musicName, artistName, lyricMusic);
    }
  }
}
