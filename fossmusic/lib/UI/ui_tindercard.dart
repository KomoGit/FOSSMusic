import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';


// static final controller = SwipableStackController();
//With each change to code base, the card stack becomes unresponsive during debugging. Decouple UI from main thread.

class TinderCard extends StatelessWidget {
  static final controller = SwipableStackController();
  const TinderCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SwipableStack(builder: (context,index){
          return Image.asset("assets/WallpaperDog-20521639.jpg"); //REMOVE ME
        },
        controller: controller,
        detectableSwipeDirections: const{
          SwipeDirection.right,
          SwipeDirection.left
        },
        onSwipeCompleted: ((index, direction){
          debugPrint("$index,$direction");
        }),
      )
    );
  }
}