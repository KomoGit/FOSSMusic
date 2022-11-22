//AudioPlayer audioPlayer = AudioPlayer();

import 'package:assets_audio_player/assets_audio_player.dart';

void playSong(String url) {
  Audio.network(url);
  //audioPlayer.play(url);
}

void pauseSong() {
  //Audio
  // audioPlayer.pause();
}
