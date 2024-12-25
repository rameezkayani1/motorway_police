// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class DownloadAndPlayScreen extends StatefulWidget {
//   @override
//   _DownloadAndPlayScreenState createState() => _DownloadAndPlayScreenState();
// }

// class _DownloadAndPlayScreenState extends State<DownloadAndPlayScreen> {
//   bool isDownloading = false;
//   String statusMessage = "Click the button to download MP3";

//   /// Download file to the Downloads folder
//   Future<void> downloadToDownloadsFolder(String url, String fileName) async {
//     setState(() {
//       isDownloading = true;
//       statusMessage = "Downloading...";
//     });

//     try {
//       // Get the external storage Downloads directory
//       Directory? downloadsDir = Directory("/storage/emulated/0/Download");
//       if (!downloadsDir.existsSync()) {
//         throw Exception("Downloads directory not found.");
//       }

//       // Full file path
//       String filePath = "${downloadsDir.path}/$fileName";

//       // Download the file
//       Dio dio = Dio();
//       await dio.download(
//         url,
//         filePath,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             setState(() {
//               statusMessage =
//                   "Downloading: ${(received / total * 100).toStringAsFixed(0)}%";
//             });
//           }
//         },
//       );

//       setState(() {
//         statusMessage = "Download complete! Saved to $filePath";
//       });
//     } catch (e) {
//       setState(() {
//         statusMessage = "Error: $e";
//       });
//     } finally {
//       setState(() {
//         isDownloading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     String fileUrl =
//         "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"; // Replace with your MP3 URL
//     String fileName = "example.mp3";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Download MP3 to Downloads Folder"),
//       ),
//       body: Center(
//         child: isDownloading
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 16),
//                   Text(statusMessage),
//                 ],
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     statusMessage,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       downloadToDownloadsFolder(fileUrl, fileName);
//                     },
//                     child: Text("Download MP3"),
//                   ),

//                 ],
//               ),
//       ),
//     );
//   }
// }
