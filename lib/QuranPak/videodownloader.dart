import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran/quran.dart' as quran;

class OfflineSurahs extends StatefulWidget {
  @override
  _OfflineSurahsState createState() => _OfflineSurahsState();
}

class _OfflineSurahsState extends State<OfflineSurahs> {
  bool isDownloading = false;
  double downloadProgress = 0.0;
  bool isPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();

  // Method to download MP3 for a Surah
  Future<void> downloadMp3(String url, String fileName) async {
    setState(() {
      isDownloading = true;
      downloadProgress = 0.0;
    });

    try {
      Directory downloadsDir = Directory("/storage/emulated/0/Download");
      if (!downloadsDir.existsSync()) {
        throw Exception("Downloads directory not found.");
      }

      String filePath = "${downloadsDir.path}/$fileName";
      Dio dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              downloadProgress = (received / total);
            });
          }
        },
      );

      setState(() {
        isDownloading = false;
        downloadProgress = 0.0;
      });
    } catch (e) {
      setState(() {
        isDownloading = false;
      });
      print("Download error: $e");
    }
  }

  // Method to play downloaded MP3
  Future<void> playDownloadedMp3(String filePath) async {
    await audioPlayer.play(DeviceFileSource(filePath));
    setState(() {
      isPlaying = true;
    });
  }

  // Method to pause the audio
  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  // Check if the file is already downloaded
  Future<bool> isFileDownloaded(String fileName) async {
    String filePath = "/storage/emulated/0/Download/$fileName";
    return await File(filePath).exists();
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
          String fileUrl = quran.getAudioURLBySurah(surahNumber);
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
                                      : () => playDownloadedMp3(
                                          "/storage/emulated/0/Download/$fileName"),
                                ),
                              ],
                            );
                          } else {
                            return IconButton(
                              icon: Icon(
                                Icons.download_outlined,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () => downloadMp3(fileUrl, fileName),
                            );
                          }
                        },
                      ),
                title: Text(
                  '$surahName (${quran.getSurahNameArabic(surahNumber)})',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Surah $surahName ($totalVerses Verses)",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
