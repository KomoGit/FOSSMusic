import 'package:flutter/material.dart';
import 'package:fossmusic/DB/db_controller.dart';
import 'package:fossmusic/DB/models/model_song.dart';

class UserInputPopUp extends StatelessWidget {
  const UserInputPopUp({super.key});
//DOESNT WORK
  @override
  Widget build(BuildContext context) {
    //TextEditingController nameController = TextEditingController();
    //List<TextEditingController> nameController = [];
    TextEditingController nameController = TextEditingController();
    TextEditingController linkController = TextEditingController();
    TextEditingController albumController = TextEditingController();
    TextEditingController artistController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Song")),
      backgroundColor: Colors.yellow,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (v) => nameController.text = v,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Insert Song Name",
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (v) => artistController.text = v,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Insert Artist Name",
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (v) => albumController.text = v,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Insert Album Name",
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (v) => linkController.text = v,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "Insert Link",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    await DatabaseHelper.instance.add(Song(
                      songName: nameController.text,
                      artistName: artistController.text,
                      link: linkController.text,
                      albumName: albumController.text,
                    ));
                  },
                  child: const Text('Submit'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
