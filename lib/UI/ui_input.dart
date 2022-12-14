import 'package:flutter/material.dart';
import 'package:fossmusic/DB/db_controller.dart';
import 'package:fossmusic/DB/models/model_song.dart';
import 'package:fossmusic/LOGIC/logic_input.dart';

//0,1,2,3......Name,Artist,Link,Album

List<TextEditingController> _controller =
    List.generate(4, (i) => TextEditingController());

class UserInputPopUp extends StatefulWidget {
  const UserInputPopUp({super.key});

  @override
  State<UserInputPopUp> createState() => _UserInputPopUpState();
}

class _UserInputPopUpState extends State<UserInputPopUp> {
  @override
  Widget build(BuildContext context) {
    clearControllerFields(_controller);
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Song")),
      backgroundColor: Colors.yellow,
      body: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text("Insert Song Name"),
                ),
                validator: (value) {
                  return value!.isEmpty ? "Value Cannot be empty" : null;
                },
              ),
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
                        songName: _controller[0].text,
                        artistName: _controller[1].text,
                        link: _controller[2].text,
                        albumName: _controller[3].text,
                      ),
                    );
                    clearControllerFields(_controller);
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
