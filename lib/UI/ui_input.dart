import 'package:flutter/material.dart';
import 'package:fossmusic/DB/db_controller.dart';
import 'package:fossmusic/DB/models/model_song.dart';
import 'package:fossmusic/LOGIC/logic_input.dart';

TextEditingController nameController = TextEditingController();
TextEditingController linkController = TextEditingController();
TextEditingController albumController = TextEditingController();
TextEditingController artistController = TextEditingController();

class UserInputPopUp extends StatefulWidget {
  const UserInputPopUp({super.key});

  @override
  State<UserInputPopUp> createState() => _UserInputPopUpState();
}

class _UserInputPopUpState extends State<UserInputPopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Song")),
      backgroundColor: Colors.yellow,
      body: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Song Name",
                  checkSongNameField(nameController), nameController),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Artist Name",
                  checkArtistNameField(artistController), artistController),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Album Name",
                  checkAlbumField(albumController), albumController),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Link",
                  checkLinkField(linkController), linkController),
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
                    clearFields();
                  },
                  child: const Text('Save'),
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
          errorText: !fieldCheck ? "Value Cannot be empty" : null));
}

void clearFields() {
  nameController.clear();
  artistController.clear();
  linkController.clear();
  albumController.clear();
}
