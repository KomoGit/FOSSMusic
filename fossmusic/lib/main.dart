import 'package:flutter/material.dart';
import 'package:fossmusic/UI/ui_home.dart';
import 'package:flutter_exoplayer/audioplayer.dart';

void main() {
  AudioPlayer.logEnabled = true;
  runApp(const Home());
}

