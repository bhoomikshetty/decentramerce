import 'package:d_commerce/constants/color.dart';
import 'package:flutter/material.dart';

class ButtonConstants extends StatelessWidget {
  Function onPressed;
  Widget child;

  ButtonConstants({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {

      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(12.0),
          ),
          backgroundColor: MaterialStateProperty.all(blueColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0)))),
      child: child,
    );
  }
}
