import 'package:flutter/material.dart';

bool checkField(TextEditingController controller) {
  return controller.text.isEmpty ? false : true;
}

void clearControllerFields(List<TextEditingController> controller) {
  for (var i = 0; i < controller.length - 1; i++) {
    controller[i].clear();
  }
}
