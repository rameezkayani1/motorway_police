import 'package:flutter/material.dart';
import 'package:motorway_police/Pak%20Study/PSCON.dart';
import 'package:motorway_police/Pak%20Study/PSGeo.dart';
import 'package:motorway_police/Pak%20Study/PSNotes.dart';
import 'package:motorway_police/Pak%20Study/PSUSEFUL.dart';
import 'package:motorway_police/Pak%20Study/PakMcqs.dart';
import 'pakaffair/PAMCQ.dart';

class GK extends StatefulWidget {
  const GK({super.key});

  @override
  State<GK> createState() => _GKState();
}

class _GKState extends State<GK> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xFF0c2d4a), Color(0xFF040D1E)]),
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          child: Image.asset(
                        "assets/logo.png",
                        height: 140,
                        width: 140,
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PAMcq()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.blueGrey[200],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(
                                        'World Important Dates And Days',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PSUSEFUL()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.green[100],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text('General Knowledge Notes',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PakConstitiiotion()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.blue[100],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text('Deserts Of The World',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),

                    //////////////////////

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PakStudyNotes()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.red[100],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text('General Geography Knowledge',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PakStudyNotes()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.orange[100],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text('Urdu General Knowledge',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PakGeography()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.purple[100],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text('River Border Mountain',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PakMcq()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(
                                        'World Countries Capital & Languages',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
