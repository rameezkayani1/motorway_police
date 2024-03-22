import 'package:flutter/material.dart';
import 'package:motorway_police/pakaffair/AandSons.dart';
import 'package:motorway_police/pakaffair/History.dart';
import 'package:motorway_police/pakaffair/PAMCQ.dart';
import 'package:motorway_police/pakaffair/Tehreek.dart';
import 'package:motorway_police/pakaffair/allabout.dart';
import 'package:motorway_police/pakaffair/gop.dart';
import 'package:motorway_police/pakaffair/indoPak.dart';
import 'pakaffair/onlinear.dart';

class PakAffair extends StatefulWidget {
  const PakAffair({super.key});

  @override
  State<PakAffair> createState() => _PakAffairState();
}

class _PakAffairState extends State<PakAffair> {
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
                          MaterialPageRoute(builder: (context) => Homepage()),
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
                                    title: Text('Pak-Affairs One Liners',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GoP()),
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
                                    title: Text('Geography Of Pakistan',
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
                              builder: (context) => const PAMcq()),
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
                                    title: Text('PAKISTAN AFFAIRS MCQS',
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
                              builder: (context) => const IndoPak()),
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
                                    title: Text(
                                        'Indo Pak History(1526 To 1947)',
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
                            color: Colors.orange[100],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text('All About Pakistan',
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
                              builder: (context) => const Akbarsons()),
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
                                    title: Text('Akbar & Sons',
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
                            color: Colors.white,
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(' Pak Study Notes',
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
                              builder: (context) => const Tehreek()),
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
                                    title: Text('Tehreek E Pakistan History',
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
                            color: Colors.blue[300],
                            child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.book, size: 36),
                                    title: Text(
                                        'History Of Pakistan 1947 To Today',
                                        style: TextStyle(fontSize: 16.0)),
                                  )
                                ])),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
