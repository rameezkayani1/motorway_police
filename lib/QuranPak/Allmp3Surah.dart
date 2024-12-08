import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

import 'AudioQuran.dart';

class AllSurahMp3 extends StatefulWidget {
  const AllSurahMp3({super.key});

  @override
  State<AllSurahMp3> createState() => _AllSurahMp3State();
}

class _AllSurahMp3State extends State<AllSurahMp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: quran.totalSurahCount, // 114 surahs
        itemBuilder: (context, surahIndex) {
          int surahNumber = surahIndex + 1;
          String surahName = quran.getSurahName(surahNumber);
          int totalVerses = quran.getVerseCount(surahNumber);
          String audioofSurah = quran.getAudioURLBySurah(surahNumber);
          print("Pakistn $audioofSurah");
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(
                    '$surahNumber',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  '$audioofSurah',

                  // "$surahName ${quran.getSurahNameArabic(surahNumber)}",
                  style: GoogleFonts.amiriQuran(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Surah $surahName",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                onTap: () {
                  // Navigate to SurahDetailPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Mp3Surah(surahNumber: surahNumber),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
