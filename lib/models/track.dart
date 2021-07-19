import 'dart:convert';
import 'package:flutter/services.dart';

class Tracks {
  int id;
  String trackName;
  String artistName;

  Tracks({this.id, this.trackName, this.artistName});

  factory Tracks.fromJson(Map<String, dynamic> parsedJson) {
    return Tracks(
        id: parsedJson["track"]["track_id"],
        trackName: parsedJson["track"]["track_name"] as String,
        artistName: parsedJson["track"]["artist_name"] as String);
  }
}

class TracksViewModel {
  static List<Tracks> tracks;

  static Future loadTracks() async {
    print("______________________________________________________");
    try {
      tracks = new List<Tracks>();
      String jsonString =
          await rootBundle.loadString('database/test_data.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson["message"]["body"]["track_list"] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        tracks.add(new Tracks.fromJson(categoryJson[i]));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
