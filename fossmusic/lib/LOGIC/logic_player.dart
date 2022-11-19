import 'package:flutter_exoplayer/audioplayer.dart';

AudioPlayer audioPlayer = AudioPlayer();

void playSong(String url) {
  audioPlayer.play(url);
}

void pauseSong() {
  audioPlayer.pause();
}
