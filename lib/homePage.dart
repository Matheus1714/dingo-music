import 'package:flutter/material.dart';
import 'colorsDefault.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'widgets/widgets.dart';
import 'models/models.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _typeAheadControllerArtist =
      TextEditingController();
  final TextEditingController _typeAheadControllerMusic =
      TextEditingController();
  String artistName = '';
  String musicName = '';
  String lyricMusic = '';
  bool findingMusic = false;
  bool initialState = true;

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
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                appName(),
                SizedBox(height: 30),
                principalIcon(),
                SizedBox(height: 30),
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                          autofocus: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome do Artista',
                          ),
                          controller: this._typeAheadControllerArtist),
                      suggestionsCallback: (pattern) async {
                        // Chamada http
                        return await Track.getSuggestions(
                            musicName, pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion["track"]["artist_name"]),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        // Quando alguem clica em um item
                        setState(() {
                          artistName =
                              suggestion["track"]["artist_name"].toString();
                        });
                        this._typeAheadControllerArtist.text =
                            suggestion["track"]["artist_name"];
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                          autofocus: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome da Música',
                          ),
                          controller: this._typeAheadControllerMusic),
                      suggestionsCallback: (pattern) async {
                        // Chamada http
                        return await Track.getSuggestions(
                            pattern, artistName);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion["track"]["track_name"]),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        // Quando alguem clica em um item
                        setState(() {
                          musicName =
                              suggestion["track"]["track_name"].toString();
                        });
                        this._typeAheadControllerMusic.text =
                            suggestion["track"]["track_name"];
                      },
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
                      lyricMusic = await Track.getMusicAPI(musicName, artistName);
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
                searchYouTubeButton(artistName, musicName),
                SizedBox(height: 30),
                musicComponent(initialState, findingMusic, musicName,
                    artistName, lyricMusic),
                SizedBox(height: 30),
                copyright(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}