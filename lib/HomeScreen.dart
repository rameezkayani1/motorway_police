import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motorway_police/pakaffair/onelinear.dart';
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
    const MyHomePage(),
    const MyHomePage(),
    const MyHomePage(),
    const MyHomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        // centerTitle: true,
        title: const Text(
          "NH&MP Test Preparation",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Daily Boster",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Sell All >",
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
                          MaterialPageRoute(builder: (context) => PakAffair()),
                        );
                      },
                      child: Container(
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
                    Container(
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
                    Container(
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
                    Container(
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
                    Container(
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
                    Container(
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
                  const Text(
                    "Subject Related",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Sell All >",
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
                    Container(
                      height: 130,
                      width: 110,
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
                    Container(
                      height: 130,
                      width: 110,
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
                    Container(
                      height: 130,
                      width: 110,
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
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                // width: double.infinity,
                child: CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        "assets/pp1.jpg",
                        fit: BoxFit.cover,
                        width: 190,
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      // height: 180,
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        "assets/pp3.jpg",
                        fit: BoxFit.cover,
                        width: 180,
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: false,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: Colors.black87,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 1',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.star,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.star,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 2',
                ),

                ///svg example
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/search_icon.svg',
                    color: Colors.blueGrey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/search_icon.svg',
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.pink,
                  ),
                  itemLabel: 'Page 4',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.yellow,
                  ),
                  itemLabel: 'Page 5',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                // log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
