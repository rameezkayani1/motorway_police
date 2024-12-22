import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri/jHijri.dart';
import 'package:adhan/adhan.dart';
import 'package:geocoding/geocoding.dart';
import '../Ads Manager/bannerads.dart';
import 'QuranPak/MainQuran.dart';
import 'Audio/TabView.dart';
import 'Islamic.dart/Qibal/compass.dart';
import 'Widgets/currentlocation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final getad = CurrentLocationWidget();
  bool isplaying = false;
  AudioPlayer player = AudioPlayer();
  Coordinates myCoordinates = Coordinates(24.8607, 67.0011);
  double? latitude;
  double? longitude; // Kushtia coordinates
  String _locationMessage = "Updating location...";
  String? latitudeA;
  String? longitudeA;

  final CalculationParameters params =
      CalculationMethod.karachi.getParameters();

  void _getLocation() async {
    try {
      Position position = await LocationHelper.getCurrentLocation();
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;

        myCoordinates = Coordinates(latitude!, longitude!);
      });

      await _getLocationName(latitude!, longitude!);
    } catch (e) {
      setState(() {
        _locationMessage = "Updating...";
      });
    }
  }

  Future<void> _getLocationName(double lat, double lon) async {
    try {
      // Perform reverse geocoding
      List<Placemark> placemarks =
          await GeocodingPlatform.instance!.placemarkFromCoordinates(lat, lon);

      if (placemarks.isNotEmpty) {
        String city = 'Updating...';
        for (var place in placemarks) {
          if (place.locality != null && place.locality!.isNotEmpty) {
            city = place.locality!;
            break;
          }
        }

        // Update the UI with the city name
        setState(() {
          _locationMessage = city;
        });
      } else {
        setState(() {
          _locationMessage = "Updating....";
        });
      }
    } catch (e) {
      setState(() {
        _locationMessage = "Updating...";
      });
    }
  }

  PrayerTimesScreen() {
    params.madhab = Madhab.hanafi;
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _getLocationName();
  // }
  Map<String, String> _getNextPrayerTimeAndName(PrayerTimes prayerTimes) {
    DateTime now = DateTime.now();
    if (now.isBefore(prayerTimes.fajr)) {
      return {'name': 'Fajr', 'time': DateFormat.jm().format(prayerTimes.fajr)};
    } else if (now.isBefore(prayerTimes.dhuhr)) {
      return {
        'name': 'Dhuhr',
        'time': DateFormat.jm().format(prayerTimes.dhuhr)
      };
    } else if (now.isBefore(prayerTimes.asr)) {
      return {'name': 'Asr', 'time': DateFormat.jm().format(prayerTimes.asr)};
    } else if (now.isBefore(prayerTimes.maghrib)) {
      return {
        'name': 'Maghrib',
        'time': DateFormat.jm().format(prayerTimes.maghrib)
      };
    } else if (now.isBefore(prayerTimes.isha)) {
      return {'name': 'Isha', 'time': DateFormat.jm().format(prayerTimes.isha)};
    } else {
      return {
        'name': 'Fajr',
        'time': DateFormat.jm().format(prayerTimes.fajr.add(Duration(days: 1)))
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    PrayerTimes prayerTimes = PrayerTimes.today(myCoordinates, params);

    Map<String, String> nextPrayer = _getNextPrayerTimeAndName(prayerTimes);
    return Stack(children: [
      Container(
          // color: const Color.fromARGB(255, 243, 235, 235),

          //     decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       Color(0xff282f39),
          //          Color(0xff282f39),
          //     ]
          //     ,
          //     // begin: Alignment.topLeft,
          //     // end: Alignment.bottomRight,
          //   ),
          // )
          ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 175,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal[300]!,
                            Colors.teal[700]!,
                          ],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/cal.png'), // Path to your image asset
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2),
                            BlendMode.darken,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Spacer(), // Pushes the Row to the bottom

                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Hijri Date and Gregorian Date
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    HijriDate.now().day.toString(),
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        HijriDate.now().monthName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        HijriDate.now().year.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    DateFormat('EEEE, dd MMMM yyyy')
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),

                              // Spacer
                              // SizedBox(width: 16),

                              // Next Prayer Info
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "$_locationMessage",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.edit,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Next Prayer Time",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                  Text(
                                    nextPrayer['time']!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    nextPrayer['name']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // alignment: Alignment.topCenter,
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.teal[300]!,
                            Colors.teal[700]!,
                          ],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/sak.PNG'), // Path to your image asset
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2),
                            BlendMode.darken,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ٱلْكَوْثَر",
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (isplaying) {
                                    await player.pause();
                                  } else if (isplaying) {
                                    await player.onPlayerComplete
                                        .listen((event) {
                                      setState(() {
                                        isplaying = false;
                                      });
                                    });
                                  } else {
                                    await player.play(
                                        AssetSource('Ayat/Al-Kauther.mp3'));
                                  }
                                  setState(() {
                                    isplaying = !isplaying;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: CircleBorder(), // Circular shape
                                  // padding: EdgeInsets.all(10), // Button padding
                                ),
                                child: Icon(
                                  isplaying ? Icons.pause : Icons.play_circle,
                                  size: 40,
                                  color: Colors.white, // Icon color
                                ),
                              )
                            ],
                          ),
                          Image.asset(
                            'assets/quran.png',
                            height: 150,
                            // width: 70,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   child: AdWidget(
                    //     ad: AdmobHelper.getBannerAd()..load(),
                    //     key: UniqueKey(),
                    //   ),
                    //   height: 40,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    buildPrayerTimesRow(context),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Feature",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100, // Set the width for each container
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.mosque_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                              Text(
                                "Qibal",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100, // Set the width for each container
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.menu_book_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                              Text(
                                "Quran",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100, // Set the width for each container
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: Colors.black,
                                size: 30,
                              ),
                              Text(
                                "Tasbeeh",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                          "Our Services",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QiblaCompass()),
                            );
                          },
                          child: Container(
                            height: 120, // Set a height
                            width:
                                120, // Make width the same as height for a perfect circle
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.green[200]!, Colors.blue[400]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape
                                  .circle, // Make the container circular
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height:
                                      80, // Adjust the size of the inner circle if needed
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Icon(
                                      Icons.location_on,
                                      size:
                                          50, // Adjust icon size to fit the inner circle
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5, // Adjust position of text
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Qibla',
                                      style: TextStyle(
                                        fontSize: 16, // Adjust font size
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 5.0,
                                            color: Colors.black45,
                                            offset: Offset(2.0, 2.0),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                  builder: (context) => MainQuranFile()),
                            );
                          },
                          child: Container(
                            // color: Colors.transparent,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.green[200]!, Colors.blue[400]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  // height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      // BoxShadow(
                                      //   color: Colors.black.withOpacity(0.3),
                                      //   spreadRadius: 2,
                                      //   blurRadius: 8,
                                      //   offset: Offset(0, 4),
                                      // ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/quran.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Quran',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 5.0,
                                            color: Colors.black45,
                                            offset: Offset(2.0, 2.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // _showPrayerTimesModal(context);
                          },
                          child: Container(
                            // color: Colors.transparent,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.green[200]!, Colors.blue[400]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  // height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      // BoxShadow(
                                      //   color: Colors.black.withOpacity(0.3),
                                      //   spreadRadius: 2,
                                      //   blurRadius: 8,
                                      //   offset: Offset(0, 4),
                                      // ),
                                    ],
                                  ),
                                  child: ClipOval(
                                      child: Icon(
                                    Icons.timer_outlined,
                                    size: 50,
                                  )),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Prayer',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 5.0,
                                            color: Colors.black45,
                                            offset: Offset(2.0, 2.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget buildPrayerTimesRow(BuildContext context) {
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    final nextPrayer =
        _getNextPrayerTimeAndName(prayerTimes); // Get the next prayer details

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Allow horizontal scrolling
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPrayerTimeTile(
                'Fajr', prayerTimes.fajr, nextPrayer['name'] == 'Fajr'),
            _buildPrayerTimeTile('Sunrise', prayerTimes.sunrise,
                nextPrayer['name'] == 'Sunrise'),
            _buildPrayerTimeTile(
                'Dhuhr', prayerTimes.dhuhr, nextPrayer['name'] == 'Dhuhr'),
            _buildPrayerTimeTile(
                'Asr', prayerTimes.asr, nextPrayer['name'] == 'Asr'),
            _buildPrayerTimeTile('Maghrib', prayerTimes.maghrib,
                nextPrayer['name'] == 'Maghrib'),
            _buildPrayerTimeTile(
                'Isha', prayerTimes.isha, nextPrayer['name'] == 'Isha'),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimeTile(
      String prayerName, DateTime prayerTime, bool isNextPrayer) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color:
            isNextPrayer ? Colors.blue : Colors.white, // Highlight next prayer
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: isNextPrayer
              ? Colors.blue
              : Colors.grey, // Border color for next prayer
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isNextPrayer ? Icons.circle : Icons.circle_outlined,
            color: isNextPrayer
                ? Colors.amber
                : Colors.black, // Change icon color for next prayer
            size: 15,
          ),
          Text(
            prayerName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isNextPrayer
                  ? Colors.white
                  : Colors.black, // Text color for next prayer
            ),
          ),
          Text(
            DateFormat.jm().format(prayerTime),
            style: TextStyle(
              color: isNextPrayer
                  ? Colors.white
                  : Colors.grey, // Time color for next prayer
            ),
          ),
        ],
      ),
    );
  }
}
