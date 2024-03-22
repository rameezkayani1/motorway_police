import 'package:flutter/material.dart';
import 'package:motorway_police/Islamic%20Study/Battle.dart';
import 'package:motorway_police/Islamic%20Study/Biography.dart';
import 'package:motorway_police/Islamic%20Study/family.dart';
import 'package:motorway_police/Islamic%20Study/fundamentals.dart';
import 'package:motorway_police/Islamic%20Study/khulfa.dart';
import 'package:motorway_police/Islamic%20Study/onliner.dart';
import 'package:motorway_police/Islamic%20Study/quran.dart';
import 'package:motorway_police/Islamic%20Study/sahaba.dart';
import 'package:motorway_police/Islamic%20Study/uhad.dart';
import 'package:motorway_police/Islamic%20Study/uhadhmra.dart';
import 'package:motorway_police/Islamic%20Study/wives.dart';
import 'package:motorway_police/pakaffair/History.dart';
import 'package:motorway_police/pakaffair/allabout.dart';

class IslamicStudy extends StatefulWidget {
  const IslamicStudy({super.key});

  @override
  State<IslamicStudy> createState() => _IslamicStudyState();
}

class _IslamicStudyState extends State<IslamicStudy> {
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
                          MaterialPageRoute(builder: (context) => Battle()),
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
                                    title: Text('Battles Of Islam',
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
                              builder: (context) => const AllAbout()),
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
                                    title: Text('About Basic Information',
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
                              builder: (context) => const Biography()),
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
                                    title: Text(
                                        'Biography Of Prophet Mohammad S.A.W',
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
                              builder: (context) => const onliner()),
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
                                    title: Text('Islamiat One Liner',
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
                              builder: (context) => const History()),
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
                                    title: Text('Islamic History Book',
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
                              builder: (context) => const khuifa()),
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
                                        'Khulfa-E-Rashedin And Ashra-Mubashr',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Uhad()),
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
                                    title: Text('Uhad And Khandaq Islamic',
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
                              builder: (context) => const Uhadhamra()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[500],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(
                                        'Battle Of Uhad & Hamra-Al-Asad',
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
                              builder: (context) => const family()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.purple[300],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(
                                        'Family Of Prophet Muhammad PBUH',
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
                              builder: (context) => const fundamentals()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.greenAccent[300],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(
                                        'Fundamentals Of Islam Namaz-Zakat-Fasting-Hajj',
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
                              builder: (context) => const Quran()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.red[300],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text('All About Holy-Quran',
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
                              builder: (context) => const sahaba()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.orange[300],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(
                                        'SAHABA-KARAM General knowledge',
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
                              builder: (context) => const wives()),
                        );
                      },
                      child: Container(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.yellow[300],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(
                                        'About-The Wives Names Of Hazrat Muhammad PBUH ',
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
