import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:swipable_stack/swipable_stack.dart';

var _aPlayer = AssetsAudioPlayer.newPlayer();

void startSong(String url) {
  _aPlayer.open(Audio.network(url), showNotification: true);
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

getAlbumCover() {
  return _aPlayer.getCurrentAudioImage;
}

void cardController(SwipeDirection direction) {
  switch (direction) {
    case SwipeDirection.right:
      nextSong();
      break;
    case SwipeDirection.left:
      previousSong();
      break;
    default:
      break;
  }
}
