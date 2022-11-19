import 'package:flutter/material.dart';
import 'package:fossmusic/DB/db_controller.dart';
import 'package:fossmusic/DB/models/model_song.dart';
import 'package:fossmusic/LOGIC/logic_player.dart';

class PlayListView extends StatefulWidget {
  const PlayListView({super.key});

  @override
  State<PlayListView> createState() => _PlayListViewState();
}

class _PlayListViewState extends State<PlayListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Song>>(
            future: DatabaseHelper.instance.getSongs(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Song>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? const Center(
                      child: Text("No songs added to the playlist."),
                    )
                  // Add padding to each of the items. And a visible border.
                  : ListView(
                      children: snapshot.data!.map((song) {
                        return Center(
                          child: ListTile(
                            title: Text(song
                                .link), //Should be combo of two strings, Singer - Song name
                            onLongPress: () {
                              setState(() {
                                DatabaseHelper.instance.remove(song.id!);
                              });
                            },
                            onTap: () {
                              playSong(song.link);
                            },
                          ),
                        );
                      }).toList(),
                    );
            }),
      ),
      backgroundColor: Colors.yellow,
    );
  }
}
