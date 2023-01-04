import 'package:flutter/material.dart';

bool checkField(TextEditingController controller) {
  return controller.text.isEmpty ? false : true;
}
