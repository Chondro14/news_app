import 'package:flutter/material.dart';

mixin Navigation {
  void go(BuildContext context, {required Widget page}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }
}
