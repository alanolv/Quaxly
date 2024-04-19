import 'package:flutter/material.dart';
import 'package:quaxly/const/colors.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key, required this.text, required this.onTapFunction, this.leadingIcon});

  final IconData? leadingIcon;
  final String text;
  final Function() onTapFunction;


  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          horizontal: 30
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 2,
            color: primaryColor
          ),
        ),
        child: Row(
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor
              ),
            ),
            if(widget.leadingIcon != null) 
            Icon(
              widget.leadingIcon,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}