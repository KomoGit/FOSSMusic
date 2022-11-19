import 'package:flutter/material.dart';
import 'package:fossmusic/UI/ui_tindercard.dart';
import 'package:swipable_stack/swipable_stack.dart';

class OverlayController extends StatelessWidget {
  const OverlayController({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              TinderCard.controller.next(swipeDirection: SwipeDirection.left,duration: const Duration(milliseconds: 750));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: const Size(60,60),
              shape: const CircleBorder()),
            child: const Icon(Icons.skip_previous,color: Colors.white,)),
            ElevatedButton(
            onPressed: () {
              //pausePressed = true;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: const Size(60,60),
              shape: const CircleBorder()),
            child: const Icon(Icons.play_arrow,color: Colors.white,)),
            ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: const Size(60,60),
              shape: const CircleBorder()),
            child: const Icon(Icons.shuffle,color: Colors.white,)),     
            ElevatedButton(
            onPressed: () {
             TinderCard.controller.next(swipeDirection: SwipeDirection.right,duration: const Duration(milliseconds: 750));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              minimumSize: const Size(60,60),
              shape: const CircleBorder()),
            child: const Icon(Icons.skip_next,color: Colors.white,)),
      ],
    );
  }
}