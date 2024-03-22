import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motorway_police/Computer/computerbasic.dart';
import 'package:motorway_police/English/English.dart';
import 'package:motorway_police/EverydayScience/EverydayScience.dart';
import 'package:motorway_police/GK/gkfull.dart';
import 'package:motorway_police/IslaminStudy.dart';
import 'package:motorway_police/PakStudy.dart';
import 'package:motorway_police/currentAffair/currentAffair.dart';
import 'package:motorway_police/pakaffair/History.dart';
import 'package:motorway_police/test.dart';

import 'pakaffair.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const IslamicStudy(),
    const PakAffair(),
    const HomeScreen(),
    const PakStudy(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xFF0c2d4a), Color(0xFF040D1E)]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            // backgroundColor: Colors.blue[400],
            centerTitle: true,
            title: const Text(
              "Solo Learner",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(
                  (0xFFFFFFFF),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: _pageController,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       "Daily Boster",
                  //       style: TextStyle(
                  //         fontSize: 18.0,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PakAffair()),
                            );
                          },
                          child: Container(
                            height: 130, // Adjust as needed

                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/PA.png",
                                  fit: BoxFit.contain,
                                  width: 70,
                                ),
                                Text(
                                  "Pak Affairs",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PakStudy()),
                            );
                          },
                          child: Container(
                            height: 130, // Adjust as needed
                            // Adjust as needed
                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/PS.jpeg",
                                  fit: BoxFit.contain,
                                  width: 70,
                                ),
                                Text(
                                  " Pak Studies",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IslamicStudy()),
                            );
                          },
                          child: Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/IS.png",
                                  fit: BoxFit.contain,
                                  width: 70,
                                ),
                                Text(
                                  "Islamic Studies",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Gkfull()),
                            );
                          },
                          child: Container(
                            height: 130, // Adjust as needed

                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/GK.png",
                                  fit: BoxFit.contain,
                                  width: 70,
                                ),
                                Text(
                                  "GK",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => currentAffair()),
                            );
                          },
                          child: Container(
                            height: 130, // Adjust as needed

                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/CA.png",
                                  fit: BoxFit.contain,
                                  width: 70,
                                ),
                                Text(
                                  "Currrent Affairs",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EverydayScience()),
                            );
                          },
                          child: Container(
                            height: 130, // Adjust as needed

                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/ES.jpeg",
                                  fit: BoxFit.contain,
                                  width: 70,
                                ),
                                Text(
                                  "Science",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subject Related",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ComputerBasic()),
                            );
                          },
                          child: Container(
                            height: 130, // Adjust as needed

                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/CB.png",
                                  fit: BoxFit.contain,
                                  height: 70,
                                  width: 70,
                                ),
                                Text(
                                  "Computer Basics",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => English()),
                            );
                          },
                          child: Container(
                            height: 130, // Adjust as needed

                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/EP.png",
                                  fit: BoxFit.contain,
                                  height: 70,
                                  width: 70,
                                ),
                                Text(
                                  "English",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EverydayScience()),
                            );
                          },
                          child: Container(
                            height: 130, // Adjust as needed

                            width: MediaQuery.of(context).size.width *
                                0.25, // Adjust as needed
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.blueGrey[200],
                            alignment: Alignment.center, // This is needed
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/MP.png",
                                  fit: BoxFit.contain,
                                  height: 70,
                                  width: 70,
                                ),
                                Text(
                                  "Mathematics",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Container(
                  //   height: 100,
                  //   // width: double.infinity,
                  //   child: CarouselSlider(
                  //     items: [
                  //       //1st Image of Slider
                  //       Container(
                  //         margin: EdgeInsets.all(6.0),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         child: Image.asset(
                  //           "assets/pp1.jpg",
                  //           fit: BoxFit.cover,
                  //           width: 190,
                  //         ),
                  //       ),

                  //       //2nd Image of Slider
                  //       Container(
                  //         // height: 180,
                  //         margin: EdgeInsets.all(6.0),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         child: Image.asset(
                  //           "assets/pp3.jpg",
                  //           fit: BoxFit.cover,
                  //           width: 180,
                  //         ),
                  //       ),
                  //     ],

                  //     //Slider Container properties
                  //     options: CarouselOptions(
                  //       height: 180.0,
                  //       enlargeCenterPage: true,
                  //       autoPlay: true,
                  //       aspectRatio: 16 / 9,
                  //       autoPlayCurve: Curves.fastOutSlowIn,
                  //       enableInfiniteScroll: true,
                  //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //       viewportFraction: 0.8,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          extendBody: true,
        ));
  }
}
