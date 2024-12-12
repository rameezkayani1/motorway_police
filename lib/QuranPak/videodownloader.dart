import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DownloadAndPlayAudio extends StatefulWidget {
  const DownloadAndPlayAudio({Key? key}) : super(key: key);

  @override
  State<DownloadAndPlayAudio> createState() => _DownloadAndPlayAudioState();
}

class _DownloadAndPlayAudioState extends State<DownloadAndPlayAudio> {
  late final Dio dio;
  double _progress = 0.0;
  String? _audioFilePath;
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    dio = Dio();
  }

  Future<void> _downloadAndSaveAudio() async {
    String url =
        'https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/1.mp3';

    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = appDocDir.path + '/audio.mp3';

      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            double progress = (received / total * 100);
            setState(() {
              _progress = progress;
            });
          }
        },
      );

      setState(() {
        _audioFilePath = savePath;
      });

      final box = await Hive.openBox<String>('audio');
      box.put('audio_path', savePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Audio downloaded and saved successfully'),
        ),
      );
    } catch (e) {
      print('Error downloading file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error downloading and saving audio'),
        ),
      );
    }
  }

  Future<void> _playAudioFromHive() async {
    final box = await Hive.openBox<String>('audio');
    String? audioPath = box.get('audio_path');

    if (audioPath != null) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => AudioPlayerScreen(audioFilePath: audioPath),
      //   ),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Audio not found in Hive database'),
        ),
      );
    }
  }

  Future<void> _togglePlayback() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(DeviceFileSource(_audioFilePath!));
    }
    setState(() {
      _isPlaying = !_isPlaying;
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
      // appBar: AppBar(
      //   title: Text('Download and Play Audio'),
      // ),
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
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.blueAccent,
                    ),
                    onPressed: _togglePlayback,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.download,
                      color: Colors.blueAccent,
                    ),
                    onPressed: _downloadAndSaveAudio,
                  ),
                ]),
              ),
            ),
          );
        },
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       if (_progress > 0 && _progress < 100)
      //         LinearProgressIndicator(
      //           value: _progress / 100,
      //           backgroundColor: Colors.grey[300],
      //           valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      //         ),
      //       SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: _downloadAndSaveAudio,
      //         child: Text("Download and Save Audio"),
      //       ),
      //       ElevatedButton(
      //         onPressed: _playAudioFromHive,
      //         child: Text("Play Audio from Hive"),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

// class AudioPlayerScreen extends StatefulWidget {
//   final String audioFilePath;

//   const AudioPlayerScreen({Key? key, required this.audioFilePath})
//       : super(key: key);

//   @override
//   _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
// }

// class _AudioPlayerScreenState extends State<AudioPlayerScreen> {


 


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ListView.builder(
//               padding: const EdgeInsets.all(8.0),
//               itemCount: quran.totalSurahCount, // 114 surahs
//               itemBuilder: (context, surahIndex) {
//                 int surahNumber = surahIndex + 1;
//                 String surahName = quran.getSurahName(surahNumber);
//                 int totalVerses = quran.getVerseCount(surahNumber);
//                 String audioOfSurah =
//                     quran.getAudioURLBySurah(surahNumber); // Dynamic audio URL
//                 String fileName =
//                     'surah_${surahNumber}.mp3'; // Define file name

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5.0),
//                   child: Card(
//                     elevation: 5,
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.teal,
//                         child: Text(
//                           '$surahNumber',
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       title: Text(
//                         '$surahName (${quran.getSurahNameArabic(surahNumber)})',
//                         style: GoogleFonts.amiriQuran(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       subtitle: Text(
//                         "Surah $surahName ($totalVerses Verses)",
//                         style:
//                             const TextStyle(fontSize: 14, color: Colors.grey),
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(
//                           _isPlaying ? Icons.pause : Icons.play_arrow,
//                           color: Colors.blueAccent,
//                         ),
//                         onPressed: _togglePlayback,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               onPressed: _togglePlayback,
//               child: Text(_isPlaying ? 'Pause Audio' : 'Play Audio'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
