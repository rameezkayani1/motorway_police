import 'dart:async';
import 'package:flutter/material.dart';
import 'package:motorway_police/HomeScreen.dart';
import 'package:motorway_police/bottombar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_new
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF0c2d4a), Color(0xFF040D1E)]),
        ),
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF0c2d4a), Color(0xFF040D1E)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: Image.asset("assets/logo.png")),
                Container(
                  child: Column(
                    children: [
                      const Text(
                        "Solo Learner",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Color(
                            (0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
