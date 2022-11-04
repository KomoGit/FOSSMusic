import 'package:flutter/material.dart';
//import 'package:flutter_exoplayer/audioplayer.dart';

String url = "";
//AudioPlayer _audioPlayer = AudioPlayer();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber ),
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
        title: const Center(child: Text("FOSS Player")),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.amber,
        destinations: [
        NavigationDestination(icon: Icon(Icons.home,color: currentIndex == 0 ? Colors.white:const Color.fromARGB(255, 214, 213, 213),), label: "Home"),
        NavigationDestination(icon: Icon(Icons.settings,color:  currentIndex == 1 ? Colors.white:const Color.fromARGB(255, 214, 213, 213),), label: "Settings"),
      ],
      onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index; 
          });
        },
        selectedIndex: currentIndex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("Add Button");//REMOVE ME
        },
        child: const Icon(Icons.add,color: Colors.white),
        ),
    );
  }
}
