import 'package:flutter/material.dart';

class AppText extends StatefulWidget {
  const AppText({super.key, required this.text, required this.fontSize, required this.fontWeight});

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  State<AppText> createState() => _AppTextState();
}


class _AppTextState extends State<AppText> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
      ),
    );
  }
}