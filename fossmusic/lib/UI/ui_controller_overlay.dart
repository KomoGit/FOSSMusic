import 'package:flutter/material.dart';

class OverlayController extends StatelessWidget {
  const OverlayController({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(60,60),
              shape: const CircleBorder()),
            child: const Icon(Icons.skip_previous,color: Colors.white,)),
            //const SizedBox(width: 25),
            ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(60,60),
              shape: const CircleBorder()),
            child: const Icon(Icons.play_arrow,color: Colors.white,)),
            //const SizedBox(width: 25),
            ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(60,60),
              shape: const CircleBorder()),
            child: const Icon(Icons.shuffle,color: Colors.white,)),
           // const SizedBox(width: 25),
            ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(60,60),
              shape: const CircleBorder()),
            child: const Icon(Icons.skip_next,color: Colors.white,)),
      ],
    );
  }
}
