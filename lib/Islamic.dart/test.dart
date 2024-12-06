import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:audioplayers/audioplayers.dart';

class Mp3Surah extends StatefulWidget {
  final int surahNumber;

  Mp3Surah({required this.surahNumber});

  @override
  _Mp3SurahState createState() => _Mp3SurahState();
}

class _Mp3SurahState extends State<Mp3Surah> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _playingAyah;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(String url, int ayahNumber) async {
    if (_playingAyah == ayahNumber) {
      await _audioPlayer.stop();
      setState(() {
        _playingAyah = null;
      });
    } else {
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _playingAyah = ayahNumber;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalAyat = quran.getVerseCount(widget.surahNumber);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          quran.getSurahName(widget.surahNumber),
          style: GoogleFonts.amiriQuran(),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: totalAyat,
        itemBuilder: (context, ayahIndex) {
          int ayahNumber = ayahIndex + 1;
          String ayahText = quran.getVerse(widget.surahNumber, ayahNumber);
          String audioUrl = quran.getAudioURLByVerse(
            widget.surahNumber,
            ayahNumber,
          );

          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ayahText,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiriQuran(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ayah $ayahNumber",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      IconButton(
                        icon: Icon(
                          _playingAyah == ayahNumber
                              ? Icons.pause_circle
                              : Icons.play_circle,
                          color: Colors.teal,
                          size: 30,
                        ),
                        onPressed: () => _playAudio(audioUrl, ayahNumber),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
