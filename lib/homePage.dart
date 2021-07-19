import 'dart:convert';
import 'package:flutter/material.dart';
import 'colorsDefault.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'models/track.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<AutoCompleteTextFieldState<Tracks>> key = new GlobalKey();

  AutoCompleteTextField searchTextField;

  TextEditingController controller = new TextEditingController();

  String artistName = '';
  String musicName = '';
  String youTubeSearch;
  String lyricMusic = '';
  bool findingMusic = false;
  bool initialState = true;

  void _loadData() async {
    await TracksViewModel.loadTracks();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  // void sugest() async {
  //   final uri = Uri.parse(
  //       'https://api.musixmatch.com/ws/1.1/track.search?format=jsonp&callback=callback&q_track=$musicName&q_artist=$artistName&quorum_factor=1&apikey=54adac49846aa5130d5ec9c73383d48a');

  //   final response = await http.get(uri);
  //   final regExp = RegExp(r'\{.*\}');
  //   final jsonStr =
  //       regExp.allMatches(response.body).map((e) => e.group(0)).toList()[0];
  //   final res = jsonDecode(jsonStr);

  //   final trackList = res["message"]["body"]["track_list"];
  //   final listTrack =
  //       trackList.map((trk) => trk["track"]["track_name"].toString()).toList();
  //   final listArtist =
  //       trackList.map((trk) => trk["track"]["artist_name"].toString()).toList();
  //   setState(() {
  //     sugestMusicName = listTrack;
  //     sugestArtistName = listArtist;
  //   });
  // }

  void _launchURL() async {
    youTubeSearch =
        'https://www.youtube.com/results?search_query=$artistName+$musicName';
    await canLaunch(youTubeSearch)
        ? await launch(youTubeSearch)
        : throw 'Could not launch $youTubeSearch';
  }

  void _getMusicAPI() async {
    try {
      final uri = Uri.parse(
          'https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?format=jsonp&callback=callback&q_track=$musicName&q_artist=$artistName&apikey=54adac49846aa5130d5ec9c73383d48a');
      final response = await http.get(uri);

      final reg = RegExp(r'\{.*\}');
      final aux =
          reg.allMatches(response.body).map((e) => e.group(0)).toList()[0];

      final res = json.decode(aux);
      setState(() {
        lyricMusic = res["message"]["body"]["lyrics"]["lyrics_body"];
      });
    } catch (err) {
      throw Exception(err);
    }
  }

  dynamic loading() {
    return Container(
      child: SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
      ),
    );
  }

  Widget lyrics() {
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

  Widget musicComponent() {
    if (initialState) {
      return Container();
    } else {
      if (findingMusic) {
        return loading();
      } else {
        return lyrics();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // sugest();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF3366FF),
              const Color(0xFF00CCFF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Dingo Music',
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
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
                ),
                SizedBox(height: 30),
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Column(
                      children: [
                        searchTextField = AutoCompleteTextField<Tracks>(
                            style: new TextStyle(
                                color: Colors.black, fontSize: 16.0),
                            decoration: new InputDecoration(
                                suffixIcon: Container(
                                  width: 85.0,
                                  height: 60.0,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                                filled: true,
                                hintText: 'Search Artist Name',
                                hintStyle: TextStyle(color: Colors.black)),
                            itemSubmitted: (item) {
                              setState(() => searchTextField
                                  .textField.controller.text = item.artistName);
                            },
                            clearOnSubmit: false,
                            key: key,
                            suggestions: TracksViewModel.tracks,
                            itemBuilder: (context, item) {
                              return Text(
                                item.artistName,
                                style: TextStyle(fontSize: 16.0),
                              );
                            },
                            itemSorter: (a, b) {
                              return a.artistName.compareTo(b.artistName);
                            },
                            itemFilter: (item, query) {
                              return item.artistName
                                  .toLowerCase()
                                  .startsWith(query.toLowerCase());
                            })
                      ],
                    ),
                  ),
                ),
                Container(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: TextField(
                    onChanged: (value) => {
                      artistName = value.toString(),
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome do Artista',
                    ),
                  ),
                )),
                SizedBox(height: 30),
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: TextField(
                      onChanged: (value) {
                        musicName = value.toString();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome da Música',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: DefaultColors.secondaryVioletColor,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      setState(() {
                        initialState = false;
                        findingMusic = true;
                      });
                      _getMusicAPI();
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          findingMusic = false;
                        });
                      });
                      setState(() {
                        artistName = artistName;
                        musicName = musicName;
                        lyricMusic = lyricMusic;
                      });
                    },
                    child: Text('Buscar Letra'),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: DefaultColors.secondaryVioletColor,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: _launchURL,
                    child: Text('Buscar no YouTube'),
                  ),
                ),
                SizedBox(height: 30),
                musicComponent(),
                SizedBox(height: 30),
                Container(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
