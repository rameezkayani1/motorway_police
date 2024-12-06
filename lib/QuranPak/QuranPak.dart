import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motorway_police/QuranPak/versedatail.dart';
import 'package:quran/quran.dart' as quran;

class FullQuranView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("القرآن الكريم"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: quran.totalSurahCount, // 114 surahs
        itemBuilder: (context, surahIndex) {
          int surahNumber = surahIndex + 1;
          String translate = quran.getAudioURLBySurah(surahNumber);
          String surahName = quran.getSurahName(surahNumber);
          String surahNameEnglish = quran.getSurahNameArabic(surahNumber);
          int totalVerses = quran.getVerseCount(surahNumber);

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
                  "$surahName ${quran.getSurahNameArabic(surahNumber)}",
                  style: GoogleFonts.amiriQuran(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Surah ${surahNumber} - ${totalVerses} Ayat",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                onTap: () {
                  // Navigate to SurahDetailPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SurahDetailPage(surahNumber: surahNumber),
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
