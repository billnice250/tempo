import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  CircularButton({this.onPressed, this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(Colors.black12),
        shape: MaterialStateProperty.all<CircleBorder>(
          CircleBorder(),
        ),
      ),
      onPressed: onPressed,
      child: Icon(
        iconData,
        size: 50.0,
        color: Colors.white,
      ),
    );
  }
}
