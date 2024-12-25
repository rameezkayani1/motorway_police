import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  int _currentIndex = 0;
  bool _isPlaying = false;

  // List of audio files
  final List<String> _audioFiles = [
    'Ayat/Al-Kauther.mp3',
    'Ayat/surah-rahman.mp3',
    'Ayat/Al-Ikhlas.mp3',
  ];

  // Getters for state
  bool get isPlaying => _isPlaying;
  int get currentIndex => _currentIndex;
  String get currentAudioName => _audioFiles[_currentIndex].split('/').last;

  // Play the current audio
  Future<void> playAudio() async {
    await _player.play(AssetSource(_audioFiles[_currentIndex]));
    _isPlaying = true;
    notifyListeners();
  }

  // Pause the audio
  Future<void> pauseAudio() async {
    await _player.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Stop the audio
  Future<void> stopAudio() async {
    await _player.stop();
    _isPlaying = false;
    notifyListeners();
  }

  // Play the next audio
  Future<void> nextAudio() async {
    if (_currentIndex < _audioFiles.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0; // Loop to the first track
    }
    await playAudio();
  }

  // Play the previous audio
  Future<void> previousAudio() async {
    if (_currentIndex > 0) {
      _currentIndex--;
    } else {
      _currentIndex = _audioFiles.length - 1; // Loop to the last track
    }
    await playAudio();
  }

  // Dispose the player
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
