import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  color: Colors.purple,
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
                      primary: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () {},
                  child: Text('Buscar Letra'),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 300.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () {},
                  child: Text('Buscar no YouTube'),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Text('Nome da Música', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                      SizedBox(height: 10),
                      Text('Nome do Cantor ou Banda', style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),),
                      SizedBox(height: 10),
                      Container(
                        child: Text('dddddddddddddddd\nqaqqqqqqqqqqqqqqqqqqqqqqqq\nsssssssssssssssssssssss\nddddddddddddddddddddddd\neeeeeeeeeeeeeeeeeeeeee\ndddddddddddddddddddd\nddddddddddddddddddddd\ndddddddddddddddddddddda\neeeeeeeeeeeeeeeeeeeeeeeeeeeee\nssssssssssssssssssssssssss\nsssssssssssssssssssssss\nsssssssssssssssssss\ndddddddddddddddd\nqaqqqqqqqqqqqqqqqqqqqqqqqq\nsssssssssssssssssssssss\nddddddddddddddddddddddd\neeeeeeeeeeeeeeeeeeeeee\ndddddddddddddddddddd\nddddddddddddddddddddd\ndddddddddddddddddddddda\neeeeeeeeeeeeeeeeeeeeeeeeeeeee\nssssssssssssssssssssssssss\nsssssssssssssssssssssss\nsssssssssssssssssss\ndddddddddddddddd\nqaqqqqqqqqqqqqqqqqqqqqqqqq\nsssssssssssssssssssssss\nddddddddddddddddddddddd\neeeeeeeeeeeeeeeeeeeeee\ndddddddddddddddddddd\nddddddddddddddddddddd\ndddddddddddddddddddddda\neeeeeeeeeeeeeeeeeeeeeeeeeeeee\nssssssssssssssssssssssssss\nsssssssssssssssssssssss\nsssssssssssssssssss', style: TextStyle(
                        color: Colors.white,
                      ),),
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
                  color: Colors.purple
                ),
                alignment: Alignment.center,
                child: Text('@copyright Dingo Music', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
