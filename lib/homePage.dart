import 'package:flutter/material.dart';
import 'colorsDefault.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String artistName = '';
  String musicName = '';
  String youTubeSearch;
  String lyricMusic = '';
  bool findMusic = false;

  void _launchURL() async {
    youTubeSearch =
        'https://www.youtube.com/results?search_query=$artistName+$musicName';
    await canLaunch(youTubeSearch)
        ? await launch(youTubeSearch)
        : throw 'Could not launch $youTubeSearch';
  }

  void _getMusicAPI() async {
    final url = Uri.parse(
        'https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?format=jsonp&callback=callback&q_track=$musicName&q_artist=$artistName&apikey=54adac49846aa5130d5ec9c73383d48a');
    final response = await http.get(url);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Dingo Music',
                      style: TextStyle(fontSize: 50),
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
                      onChanged: (value) => {musicName = value},
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      print(artistName);
                      print(musicName);
                      await _getMusicAPI();
                      setState(() {
                        artistName = artistName;
                        musicName = musicName;
                        lyricMusic = lyricMusic;
                        findMusic = true;
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: _launchURL,
                    child: Text('Buscar no YouTube'),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: DefaultColors.secondaryVioletColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          '$musicName',
                          style: TextStyle(
                              color: DefaultColors.whiteColor, fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '$artistName',
                          style: TextStyle(
                              color: DefaultColors.whiteColor, fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '$lyricMusic',
                            style: TextStyle(
                              color: DefaultColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
