import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color? textColor;
  final String text;
  const Button({
    super.key,
    required this.backgroundColor,
    this.textColor = Colors.black,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 48.0,
          vertical: 20,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
