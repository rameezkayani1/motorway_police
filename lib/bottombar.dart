import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:motorway_police/HomeScreen.dart';
import 'package:motorway_police/IslaminStudy.dart';
import 'package:motorway_police/PakStudy.dart';
import 'package:motorway_police/pakaffair.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const IslamicStudy(),
    const PakAffair(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? Builder(
              builder: (BuildContext context) {
                return AnimatedNotchBottomBar(
                  notchBottomBarController: _controller,
                  color: Colors.white,
                  showLabel: false,
                  shadowElevation: 5,
                  kBottomRadius: 28.0,
                  notchColor: Colors.black87,
                  removeMargins: false,
                  bottomBarWidth: 500,
                  showShadow: false,
                  durationInMilliSeconds: 300,
                  bottomBarItems: const [
                    BottomBarItem(
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
                    // BottomBarItem(
                    //   inActiveItem: Icon(
                    //     Icons.star,
                    //     color: Colors.blueGrey,
                    //   ),
                    //   activeItem: Icon(
                    //     Icons.star,
                    //     color: Colors.blueAccent,
                    //   ),
                    //   itemLabel: 'Page 2',
                    // ),
                    BottomBarItem(
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
                    BottomBarItem(
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
                    log('current selected index $index');
                    _pageController.jumpToPage(index);
                  },
                  kIconSize: 24.0,
                );
              },
            )
          : null,
    );
  }
}
