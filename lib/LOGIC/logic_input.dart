import 'package:flutter/material.dart';

bool checkField(TextEditingController controller) {
  return controller.text.isEmpty ? false : true;
}

//Incase you get out of range issues, add -1 to controller.length (controller.length -1)
void clearControllerFields(List<TextEditingController> controller) {
  for (var i = 0; i < controller.length; i++) {
    controller[i].clear();
  }
}
