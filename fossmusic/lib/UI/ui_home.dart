import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fossmusic/UI/ui_controller_overlay.dart';
import 'package:fossmusic/UI/ui_input.dart';
import 'package:fossmusic/UI/ui_playlist.dart';
import 'package:fossmusic/UI/ui_tindercard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Center(child: Text("FOSSPlayer")),
      ),
      backgroundColor: Colors.yellow,
      body: const Center(
        child: TinderCard(),
      ),
      drawer: const PlayListView(),
      floatingActionButton: const OverlayController(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.85))
          ],
        ),
        child: NavigationBar(
          backgroundColor: Colors.orange,
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home,
                    color: currentIndex == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 214, 213, 213),
                    size: 30),
                label: ""), //Back to home
            FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => const UserInputPopUp());
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            NavigationDestination(
                icon: Icon(Icons.settings,
                    color: currentIndex == 2
                        ? Colors.white
                        : const Color.fromARGB(255, 214, 213, 213),
                    size: 30),
                label: ""), //Go to a entirely new page.
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedIndex: currentIndex,
        ),
      ),
    );
  }
}
