import 'package:flutter/material.dart';
import 'package:quaxly/const/colors.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key, required this.text, required this.onTapFunction, this.leadingIcon, this.isFilled = false, this.hasShadow = false});

  final IconData? leadingIcon;
  final String text;
  final Function() onTapFunction;
  final bool isFilled;
  final bool hasShadow; 


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
          boxShadow: widget.hasShadow ? const [
            BoxShadow(
              color: Color.fromARGB(93, 23, 23, 23),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 3)
            )
          ] : [],
          border: Border.all(
            width: 2,
            color: primaryColor
          ),
          color: widget.isFilled ? primaryColor : Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.isFilled ? Colors.white : primaryColor
              ),
            ),
            const Spacer(),
            if(widget.leadingIcon != null) 
            Icon(
              widget.leadingIcon,
              color: widget.isFilled ? Colors.white : primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}