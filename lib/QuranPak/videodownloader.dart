import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AllSurahMp3Scoped extends StatefulWidget {
  const AllSurahMp3Scoped({super.key});

  @override
  State<AllSurahMp3Scoped> createState() => _AllSurahMp3ScopedState();
}

class _AllSurahMp3ScopedState extends State<AllSurahMp3Scoped> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Dio _dio = Dio();
  bool isDownloading = false;
  double downloadProgress = 0.0;
  String? downloadedFilePath;
  bool isPlaying = false;

  // Get a public folder path for Scoped Storage (Android 10+ compatible)
  Future<String> getScopedStoragePath(String fileName) async {
    final directory = await getExternalStorageDirectory();
    final scopedPath =
        '${directory?.path ?? '/storage/emulated/0/Download'}/QuranMp3';
    print("scope Path : $scopedPath");
    // Create directory if it doesn't exist
    final dir = Directory(scopedPath);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    return '$scopedPath/$fileName';
  }

  // Function to download MP3
  Future<void> downloadMp3(String url, String fileName) async {
    try {
      setState(() {
        isDownloading = true;
        downloadProgress = 0.0;
      });

      // Get file path
      final filePath = await getScopedStoragePath(fileName);
      print("Downloading to: $filePath");

      // Download the file
      await _dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              downloadProgress = received / total;
            });
          }
        },
      );

      setState(() {
        isDownloading = false;
        downloadedFilePath = filePath;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download completed! File saved at $filePath')),
      );
    } catch (e) {
      setState(() {
        isDownloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading file: $e')),
      );
    }
  }

  // Check if file exists
  Future<bool> isFileDownloaded(String fileName) async {
    final filePath = await getScopedStoragePath(fileName);
    final file = File(filePath);
    return file.existsSync();
  }

  // Play the downloaded MP3
  Future<void> playDownloadedMp3() async {
    if (downloadedFilePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file downloaded to play!')),
      );
      return;
    }

    try {
      await _audioPlayer.play(DeviceFileSource(downloadedFilePath!));
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error playing audio: $e')),
      );
    }
  }

  // Pause audio
  Future<void> pauseAudio() async {
    try {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error pausing audio: $e')),
      );
    }
  }

  // Stop audio
  Future<void> stopAudio() async {
    try {
      await _audioPlayer.stop();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error stopping audio: $e')),
      );
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, surahIndex) {
          int surahNumber = surahIndex + 1;
          String surahName = quran.getSurahName(surahNumber);
          int totalVerses = quran.getVerseCount(surahNumber);
          String audioOfSurah = quran.getAudioURLBySurah(surahNumber);
          String fileName = 'surah_${surahNumber}.mp3';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(
                    '$surahNumber',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                trailing: isDownloading
                    ? CircularProgressIndicator(value: downloadProgress)
                    : FutureBuilder<bool>(
                        future: isFileDownloaded(fileName),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          if (snapshot.hasData && snapshot.data == true) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: isPlaying
                                      ? pauseAudio
                                      : playDownloadedMp3,
                                ),
                              ],
                            );
                          } else {
                            return IconButton(
                              icon: Icon(
                                Icons.download_outlined,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () =>
                                  downloadMp3(audioOfSurah, fileName),
                            );
                          }
                        },
                      ),
                title: Text(
                  '$surahName (${quran.getSurahNameArabic(surahNumber)})',
                  style: GoogleFonts.amiriQuran(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Surah $surahName ($totalVerses Verses)",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
