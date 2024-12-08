import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class AllSurahMp322 extends StatefulWidget {
  const AllSurahMp322({super.key});

  @override
  State<AllSurahMp322> createState() => _AllSurahMp322State();
}

class _AllSurahMp322State extends State<AllSurahMp322> {
  final Dio _dio = Dio();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Map<int, String> _localFilePaths = {};
  final Map<int, String> _currentStates =
      {}; // 'not_downloaded', 'downloading', 'ready', 'playing'

  Future<String> _downloadAudio(String url, int surahNumber) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${url.split('/').last}';

    if (File(filePath).existsSync()) {
      return filePath; // File already exists
    }

    setState(() {
      _currentStates[surahNumber] = 'downloading';
    });

    await _dio.download(url, filePath);
    setState(() {
      _currentStates[surahNumber] = 'ready';
      _localFilePaths[surahNumber] = filePath;
    });

    return filePath;
  }

  Future<void> _playAudio(int surahNumber) async {
    try {
      final localPath = _localFilePaths[surahNumber];
      if (localPath != null) {
        await _audioPlayer.play(DeviceFileSource(localPath));
        setState(() {
          _currentStates[surahNumber] = 'playing';
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _pauseAudio(int surahNumber) async {
    await _audioPlayer.pause();
    setState(() {
      _currentStates[surahNumber] = 'ready';
    });
  }

  Future<void> _stopAudio(int surahNumber) async {
    await _audioPlayer.stop();
    setState(() {
      _currentStates[surahNumber] = 'ready';
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Surah MP3', style: GoogleFonts.amiriQuran()),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: quran.totalSurahCount, // 114 surahs
        itemBuilder: (context, surahIndex) {
          int surahNumber = surahIndex + 1;
          String surahName = quran.getSurahName(surahNumber);
          String audioofSurah = quran.getAudioURLBySurah(surahNumber);
          String currentState = _currentStates[surahNumber] ?? 'not_downloaded';

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
                  currentState == 'downloading'
                      ? "Downloading..."
                      : "Surah $surahName",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                trailing: currentState == 'not_downloaded'
                    ? IconButton(
                        icon: Icon(Icons.download),
                        onPressed: () =>
                            _downloadAudio(audioofSurah, surahNumber),
                      )
                    : currentState == 'downloading'
                        ? CircularProgressIndicator()
                        : currentState == 'ready'
                            ? IconButton(
                                icon: Icon(Icons.play_arrow),
                                onPressed: () => _playAudio(surahNumber),
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.pause),
                                    onPressed: () => _pauseAudio(surahNumber),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.stop),
                                    onPressed: () => _stopAudio(surahNumber),
                                  ),
                                ],
                              ),
              ),
            ),
          );
        },
      ),
    );
  }
}
