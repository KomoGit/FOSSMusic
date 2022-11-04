import 'package:flutter/material.dart';
import 'package:fossmusic/UI/Home.dart';
import 'package:flutter_exoplayer/audioplayer.dart';

void main() {
  AudioPlayer.logEnabled = true;
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: Home(),
    ),
  );
}

