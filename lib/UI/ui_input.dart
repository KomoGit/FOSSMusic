import 'package:flutter/material.dart';
import 'package:fossmusic/DB/db_controller.dart';
import 'package:fossmusic/DB/models/model_song.dart';
import 'package:fossmusic/LOGIC/logic_input.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Song")),
      backgroundColor: Colors.yellow,
      body: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Song Name",
                  checkField(_controller[0]), _controller[0]),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Artist Name",
                  checkField(_controller[1]), _controller[1]),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Album Name",
                  checkField(_controller[2]), _controller[2]),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _userInputField(context, "Insert Link",
                  checkField(_controller[3]), _controller[3]),
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

Widget _userInputField(
    BuildContext context, String label, bool fieldCheck, controller) {
  return TextField(
      onChanged: (v) => controller.text = v,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          labelText: label,
          errorText: !fieldCheck ? "Value Cannot be empty" : null));
}
