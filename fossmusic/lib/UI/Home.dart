import 'package:flutter/material.dart';
import 'package:flutter_exoplayer/audioplayer.dart';

String url = "";
AudioPlayer _audioPlayer = AudioPlayer();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Example title'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: const Center(
        child: Text('Hello, world!'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        onPressed: () => _audioPlayer.play(url),
        child: const Icon(Icons.add),
      ),
    );
  }
}