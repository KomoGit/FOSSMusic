import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';


final controller = SwipableStackController();

//With each change to code base, the card stack becomes unresponsive during debugging. Decouple UI from main thread.

class TinderCard extends StatelessWidget {
  const TinderCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SwipableStack(builder: (context,index){
          return Image.network("https://images.pexels.com/photos/14270583/pexels-photo-14270583.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"); //REMOVE ME
        },
      )
    );
  }
}