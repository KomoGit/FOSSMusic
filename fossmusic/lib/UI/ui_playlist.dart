import 'package:flutter/material.dart';
import 'package:fossmusic/DB/db_controller.dart';
import 'package:fossmusic/DB/models/model_song.dart';
import 'package:fossmusic/LOGIC/logic_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class PlayListView extends StatefulWidget {
  const PlayListView({super.key});

  @override
  State<PlayListView> createState() => _PlayListViewState();
}

class _PlayListViewState extends State<PlayListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Playlist",
        style: GoogleFonts.bebasNeue(),
      )),
      body: Center(
        child: FutureBuilder<List<Song>>(
            future: DatabaseHelper.instance.getSongs(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Song>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.white, size: 60),
                );
              }
              return snapshot.data!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/empty-box.json"),
                          Text(
                            "Your playlist is empty.",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    )
                  : ListView(
                      children: snapshot.data!.map((song) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ListTile(
                              title:
                                  Text("${song.artistName}-${song.songName}"),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.black, width: 0.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Warning"),
                                        content: Text(
                                            "Do you wish to delete ${song.songName}?"),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                DatabaseHelper.instance
                                                    .remove(song.id!);
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        ],
                                      );
                                    });
                                // setState(() {
                                //   //TODO: Instead of outright deleting what ever is held, best to pop up a notification box and ask.
                                //   DatabaseHelper.instance.remove(song.id!);
                                // });
                              },
                              onTap: () {
                                startSong(song.link);
                              },
                            ),
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
