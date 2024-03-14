import 'package:flutter/material.dart';

import 'pakaffair/onelinear.dart';
import 'pakaffair/onlinear.dart';

class PakAffair extends StatefulWidget {
  const PakAffair({super.key});

  @override
  State<PakAffair> createState() => _PakAffairState();
}

class _PakAffairState extends State<PakAffair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
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
                Container(
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
                Container(
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.yellow[100],
                      child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.book, size: 36),
                              title: Text('PAKISTAN AFFAIRS MCQ All-Exams-',
                                  style: TextStyle(fontSize: 16.0)),
                            )
                          ])),
                ),
                //////////////////////

                Container(
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
                              title: Text('Indo Pak History(1526 To 1947)',
                                  style: TextStyle(fontSize: 16.0)),
                            )
                          ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
