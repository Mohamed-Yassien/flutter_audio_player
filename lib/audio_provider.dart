import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider with ChangeNotifier {
  AudioProvider() {
    initAudio();
  }

  Duration totalDuration;
  Duration position;
  String audioState;

  AudioPlayer audioPlayer = AudioPlayer();

  initAudio() {
    audioPlayer.onDurationChanged.listen((val) {
      totalDuration = val;
      notifyListeners();
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      position = event;
      notifyListeners();
    });
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == AudioPlayerState.PLAYING) audioState = 'play';
      if (state == AudioPlayerState.PAUSED) audioState = 'pause';

      notifyListeners();
    });
  }

  playAudio() {
    audioPlayer.play(
      'https://ms18.sm3na.com/137/Sm3na_com_62787.mp3',
    );
  }

  stopAudio() {
    audioPlayer.stop();
  }

  pauseAudio() {
    audioPlayer.pause();
  }

  seekAudio(Duration duration){
    audioPlayer.seek(duration);
  }
}
