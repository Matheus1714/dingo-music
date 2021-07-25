import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Track {
  static getSuggestions(String musicName, String artistName) async {
    if (artistName != "") {
      final uri = Uri.parse(
          'https://api.musixmatch.com/ws/1.1/track.search?format=jsonp&callback=callback&&q_track=$musicName&q_artist=$artistName&quorum_factor=1&apikey=54adac49846aa5130d5ec9c73383d48a');

      final response = await http.get(uri);
      final regExp = RegExp(r'\{.*\}');
      final jsonStr =
          regExp.allMatches(response.body).map((e) => e.group(0)).toList()[0];
      final res = jsonDecode(jsonStr);

      final trackList = res["message"]["body"]["track_list"];
      return trackList;
    } else {
      return {};
    }
  }
  static searchYouTube(String artistName, String musicName) async {
    final youTubeSearch =
        'https://www.youtube.com/results?search_query=$artistName+$musicName';
    await canLaunch(youTubeSearch)
        ? await launch(youTubeSearch)
        : throw 'Could not launch $youTubeSearch';
  }
  static getMusicAPI(String musicName, String artistName) async {
    try {
      final uri = Uri.parse(
          'https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?format=jsonp&callback=callback&q_track=$musicName&q_artist=$artistName&apikey=54adac49846aa5130d5ec9c73383d48a');
      final response = await http.get(uri);

      final reg = RegExp(r'\{.*\}');
      final aux =
          reg.allMatches(response.body).map((e) => e.group(0)).toList()[0];

      final res = json.decode(aux);
      return res["message"]["body"]["lyrics"]["lyrics_body"];
    } catch (err) {
      throw Exception(err);
    }
  }
}