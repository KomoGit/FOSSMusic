import 'package:flutter/material.dart';
import 'package:fossmusic/LOGIC/logic_player.dart';
import 'package:swipable_stack/swipable_stack.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({super.key});
  static final controller = SwipableStackController();

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SwipableStack(
        builder: (context, index) {
          if (getAlbumCover() != null) {
            return Image.asset(getAlbumCover());
          }
          return Image.asset("assets/WallpaperDog-20521641.jpg"); //REMOVE ME
        },
        controller: TinderCard.controller,
        detectableSwipeDirections: const {
          SwipeDirection.right,
          SwipeDirection.left
        },
        onSwipeCompleted: ((index, direction) {
          debugPrint("$index,$direction");
        }),
      ),
    );
  }
}

// class TinderCard extends StatelessWidget {
//   static final controller = SwipableStackController();
//   const TinderCard({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.transparent,
//       body: SwipableStack(
//         builder: (context, index) {
//           if (getAlbumCover() != null) {
//             return Image.asset(getAlbumCover());
//           }
//           return Image.asset("assets/WallpaperDog-20521641.jpg"); //REMOVE ME
//         },
//         controller: controller,
//         detectableSwipeDirections: const {
//           SwipeDirection.right,
//           SwipeDirection.left
//         },
//         onSwipeCompleted: ((index, direction) {
//           debugPrint("$index,$direction");
//         }),
//       ),
//     );
//   }
// }
