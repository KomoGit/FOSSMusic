import 'package:flutter/material.dart';

class PlayListView extends StatefulWidget {
  const PlayListView({super.key});

  @override
  State<PlayListView> createState() => _PlayListViewState();
}

class _PlayListViewState extends State<PlayListView> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}