import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';

import '../Audio/TabView.dart';
import 'Allmp3Surah.dart';
import 'QuranPak.dart';

class MainQuranFile extends StatefulWidget {
  const MainQuranFile({Key? key}) : super(key: key);

  @override
  State<MainQuranFile> createState() => _MainQuranFileState();
}

class _MainQuranFileState extends State<MainQuranFile> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    final selectedTextStyle = textStyle?.copyWith(fontWeight: FontWeight.bold);
    return
        // Provides the [TabController]
        Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4527A0),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("assets/quran.png",
              fit: BoxFit.cover, height: 20.00, width: 20.00),
        ),
        title: const Text(
          "Salaah القرآن الكريم",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // Get.to(SearchPage());
              },
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SegmentedTabControl(
                  // Customization of widget
                  tabTextColor: Colors.black,
                  selectedTabTextColor: Colors.white,
                  indicatorPadding: const EdgeInsets.all(4),
                  squeezeIntensity: 2,
                  tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                  textStyle: textStyle,
                  selectedTextStyle: selectedTextStyle,
                  // Options for selection
                  // All specified values will override the [SegmentedTabControl] setting
                  tabs: [
                    SegmentTab(
                      label: 'Reading',
                      // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                      color: Colors.red.shade300,
                      backgroundColor: Colors.red.shade100,
                    ),
                    SegmentTab(
                      label: 'Audios',
                      backgroundColor: Colors.blue.shade100,
                      color: Colors.blue.shade300,
                    ),
                    SegmentTab(
                      label: 'Favourite',
                      backgroundColor: Colors.orange.shade100,
                      color: Colors.orange.shade300,
                    ),
                  ],
                ),
              ),
              // Sample pages
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    FullQuranView(),
                    const AllSurahMp3(),
                    AllSurahMp322(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Text(label),
    );
  }
}
