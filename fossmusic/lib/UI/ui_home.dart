import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fossmusic/UI/ui_tindercard.dart';
//import 'package:flutter_exoplayer/audioplayer.dart';

String url = "";
//AudioPlayer _audioPlayer = AudioPlayer();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
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
      appBar: AppBar(
        title: const Center(child: Text("FOSSPlayer")),
      ),
      body: const Center(child: TinderCard(),),
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
          backgroundColor: Colors.amber,
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home,color: currentIndex == 0 ? Colors.white : const Color.fromARGB(255, 214, 213, 213),),
                label: "Home"),//Back to home
            NavigationDestination(
                icon: Icon(Icons.add_circle,color: currentIndex == 1 ? Colors.white : const Color.fromARGB(255, 214, 213, 213),),
                label: "Add"),//Open a pop-up to add a new song.
            NavigationDestination(
              icon: Icon(Icons.settings,color: currentIndex == 2 ? Colors.white : const Color.fromARGB(255, 214, 213, 213),),
              label: "Settings"),//Go to a entirely new page. 
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
