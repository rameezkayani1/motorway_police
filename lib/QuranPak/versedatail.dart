import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:audioplayers/audioplayers.dart';

class SurahDetailPage extends StatefulWidget {
  final int surahNumber;

  SurahDetailPage({required this.surahNumber});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  // AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.lowLatency);

  bool isPlaying = false;
  bool isplaying = false;
  AudioPlayer player = AudioPlayer();
  String? audioURL;
  late Source audioUrl;

  @override
  Widget build(BuildContext context) {
    String surahName = quran.getSurahName(widget.surahNumber);
    int totalVerses = quran.getVerseCount(widget.surahNumber);
    String paragraphText1 = "";
    for (int i = 1; i <= totalVerses; i++) {
      paragraphText1 +=
          "${quran.getVerse(widget.surahNumber, i, verseEndSymbol: true)} ";
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          " ${quran.getSurahNameArabic(widget.surahNumber)} ",
          style:
              GoogleFonts.amiriQuran(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                quran.basmala,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: totalVerses,
                    itemBuilder: (context, verseIndex) {
                      int verseNumber = verseIndex + 1;

                      // Get verse in Arabic and its Urdu translation
                      String arabicVerse = quran.getVerse(
                          widget.surahNumber, verseNumber,
                          verseEndSymbol: true);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: Card(
                          elevation: 0,
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Arabic verse
                                Text(
                                  arabicVerse,
                                  style: GoogleFonts.amiriQuran(fontSize: 22),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
