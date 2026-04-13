import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? height;
  final Color? bgColor;
  final Color? textColor;
  const BasicAppButton({
    this.height,
    super.key,
    required this.onPressed,
    required this.text,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        minimumSize: Size.fromHeight(
          height ?? 80,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
