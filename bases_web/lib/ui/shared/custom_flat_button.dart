import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const CustomFlatButton(
      {super.key,
      required this.text,
      this.color = Colors.pink,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: color,
      ),
      onPressed: () => onPressed(),
      child: Text(text),
    );
  }
}
