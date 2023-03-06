import 'package:flutter/material.dart';

double heightFunc(BuildContext context, {bool original = true}) {
  return original
      ? MediaQuery.of(context).size.height
      : MediaQuery.of(context).size.width;
}

double widthFunc(BuildContext context, bool original) {
  return original
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
}

Orientation orientation(BuildContext context) {
  return MediaQuery.of(context).orientation;
}
