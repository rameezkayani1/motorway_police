import 'package:flutter/material.dart';
import 'package:motorway_police/Pak%20Study/PSCON.dart';
import 'package:motorway_police/Pak%20Study/PSGeo.dart';
import 'package:motorway_police/Pak%20Study/PSNotes.dart';
import 'package:motorway_police/Pak%20Study/PSUSEFUL.dart';
import 'package:motorway_police/Pak%20Study/PakMcqs.dart';

import 'pakaffair/PAMCQ.dart';

class PakStudy extends StatefulWidget {
  const PakStudy({super.key});

  @override
  State<PakStudy> createState() => _PakStudyState();
}

class _PakStudyState extends State<PakStudy> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xFF0c2d4a), Color(0xFF040D1E)]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
                                    title: Text('Pak Study Mcqs',
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
                                    title: Text('Pakistan Affair Useful',
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
                                    title: Text('Pak Constitutional History',
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
                                    title: Text('Pak Study Notes',
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
                                    title: Text(
                                        'Pakistan History Most Important Notes',
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
                                    title: Text(
                                        'Pak Studies Geography Demography',
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
                                    title: Text('PAK STUDIES MCQs',
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
