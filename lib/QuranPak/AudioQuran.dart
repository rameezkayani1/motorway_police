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
  bool _isPlayingSurah = false;

  /// Play full Surah
  void _playFullSurah() async {
    setState(() {
      _isPlayingSurah = true;
      _playingAyah = 1;
    });

    int totalAyat = quran.getVerseCount(widget.surahNumber);
    for (int ayahNumber = 1; ayahNumber <= totalAyat; ayahNumber++) {
      if (!_isPlayingSurah) break; // Stop if the user interrupts playback

      String audioUrl =
          quran.getAudioURLByVerse(widget.surahNumber, ayahNumber);

      // Play the current Ayah
      await _audioPlayer.play(UrlSource(audioUrl));

      // Wait for the audio to finish
      await _audioPlayer.onPlayerComplete.first;

      setState(() {
        _playingAyah = ayahNumber + 1;
      });
    }

    setState(() {
      _isPlayingSurah = false;
      _playingAyah = null;
    });
  }

  /// Stop Surah Playback
  void _stopPlayback() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlayingSurah = false;
      _playingAyah = null;
    });
  }

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
          // quran.getSurahName(widget.surahNumber)
          quran.getSurahNameArabic(widget.surahNumber),

          style: GoogleFonts.amiriQuran(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
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
          String translation = quran.getVerseTranslation(
            widget.surahNumber,
            ayahNumber,
            translation: quran.Translation.enSaheeh,
          );
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    ayahText,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiriQuran(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    translation,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.amiriQuran(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          _playingAyah == ayahNumber
                              ? Icons.pause_circle
                              : Icons.play_circle,
                          color: Colors.teal,
                          size: 40,
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
      floatingActionButton: SizedBox(
        height: 60, // Increased height
        width: 60, //
        child: FloatingActionButton(
          onPressed: _isPlayingSurah ? _stopPlayback : _playFullSurah,
          child: Icon(
            _isPlayingSurah ? Icons.pause : Icons.headphones,
            size: 40,
            color: Colors.yellow,
          ),
          backgroundColor: Colors.teal,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
