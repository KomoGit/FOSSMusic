import 'package:flutter/material.dart';
import 'package:fossmusic/DB/db_controller.dart';
import 'package:fossmusic/DB/models/model_song.dart';

class UserInputPopUp extends StatelessWidget {
  const UserInputPopUp({super.key});
//DOESNT WORK
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return AlertDialog(
      title: const Text('Add song to playlist'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                onChanged: (v) => nameController.text = v,
                decoration: const InputDecoration(
                  labelText: 'Insert Link',
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    await DatabaseHelper.instance.add(Song(link: nameController.text));
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
