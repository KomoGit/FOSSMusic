import 'package:flutter/material.dart';
import 'package:fossmusic/DB/db_controller.dart';
import 'package:fossmusic/DB/models/model_song.dart';

TextEditingController nameController = TextEditingController();
TextEditingController linkController = TextEditingController();
TextEditingController albumController = TextEditingController();
TextEditingController artistController = TextEditingController();

class UserInputPopUp extends StatelessWidget {
  const UserInputPopUp({super.key});
//DOESNT WORK
  @override
  Widget build(BuildContext context) {
    //TextEditingController nameController = TextEditingController();
    //List<TextEditingController> nameController = [];

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Song")),
      backgroundColor: Colors.yellow,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Song Name",
                  checkSongNameField(), nameController),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Artist Name",
                  checkArtistNameField(), artistController),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Album Name",
                  checkAlbumField(), albumController),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(
                  context, "Insert Link", checkLinkField(), linkController),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await DatabaseHelper.instance.add(
                      Song(
                        songName: nameController.text,
                        artistName: artistController.text,
                        link: linkController.text,
                        albumName: albumController.text,
                      ),
                    );
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

Widget _userInputField(
    BuildContext context, String label, bool fieldCheck, controller) {
  return TextField(
      onChanged: (v) => controller.text = v,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          labelText: label,
          // ));
          errorText: !fieldCheck ? "Value Cannot be empty" : ""));
}

//This checks whether fields are empty. Right now they only server UI purpose.
bool checkLinkField() {
  if (linkController.text.isEmpty) {
    return false;
  }
  return true;
}

bool checkArtistNameField() {
  if (artistController.text.isEmpty) {
    return false;
  }
  return true;
}

bool checkAlbumField() {
  if (albumController.text.isEmpty) {
    return false;
  }
  return true;
}

bool checkSongNameField() {
  if (nameController.text.isEmpty) {
    return false;
  } else {
    return true;
  }
}
