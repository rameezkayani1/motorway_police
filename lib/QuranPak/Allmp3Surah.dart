import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io'; // To check for file existence

class AllSurahMp3 extends StatefulWidget {
  const AllSurahMp3({super.key});

  @override
  State<AllSurahMp3> createState() => _AllSurahMp3State();
}

class _AllSurahMp3State extends State<AllSurahMp3> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Dio _dio = Dio();
  bool isDownloading = false;
  double downloadProgress = 0.0;
  String? downloadedFilePath;
  bool isPlaying = false;

  // Function to download MP3
  Future<void> downloadMp3(String url, String fileName) async {
    try {
      setState(() {
        isDownloading = true;
        downloadProgress = 0.0;
      });

      // Get the app's document directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      print("Location :  $filePath");

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

  // Function to check if the file is already downloaded
  Future<bool> isFileDownloaded(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);
    return file.exists(); // Check if the file exists
  }

  // Function to play the downloaded MP3
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

  // Function to pause audio
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

  // Function to stop audio
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
        itemCount: quran.totalSurahCount, // 114 surahs
        itemBuilder: (context, surahIndex) {
          int surahNumber = surahIndex + 1;
          String surahName = quran.getSurahName(surahNumber);
          int totalVerses = quran.getVerseCount(surahNumber);
          String audioOfSurah =
              quran.getAudioURLBySurah(surahNumber); // Dynamic audio URL
          String fileName = 'surah_${surahNumber}.mp3'; // Define file name

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
                        future:
                            isFileDownloaded(fileName), // Check if file exists
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          if (snapshot.hasData && snapshot.data == true) {
                            // If file is already downloaded
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
                            // If file is not downloaded
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
