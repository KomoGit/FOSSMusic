import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';


final controller = SwipableStackController();
var imageURL = <String>{
  "https://wallpaper.dog/download-wallpaper/20521641_1080x1920",
  "https://wallpaper.dog/download-wallpaper/20521639_1080x1920",
  "https://wallpaper.dog/download-wallpaper/20521642_1080x1920",
};
//With each change to code base, the card stack becomes unresponsive during debugging. Decouple UI from main thread.

class TinderCard extends StatelessWidget {
  const TinderCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SwipableStack(builder: (context,index){
          return Image.network(imageURL.first); //REMOVE ME
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