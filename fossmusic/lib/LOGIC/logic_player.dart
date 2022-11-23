//AudioPlayer audioPlayer = AudioPlayer();

import 'package:assets_audio_player/assets_audio_player.dart';

var _aPlayer = AssetsAudioPlayer.newPlayer();

void startSong(String url) {
  _aPlayer.open(Audio.network(url));
}

void continueSong() {
  _aPlayer.play();
}

void pauseSong() {
  _aPlayer.pause();
}

void nextSong() {
  _aPlayer.next();
}

void previousSong() {
  _aPlayer.previous();
}
