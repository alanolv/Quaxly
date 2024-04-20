import 'package:flutter/material.dart';
import 'package:quaxly/const/colors.dart';


class ActionShortButton extends StatelessWidget {
  final String text;
  final Function() onTapFunction;

  const ActionShortButton({
    Key? key,
    required this.text,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  onPressed: onTapFunction,
  style: ElevatedButton.styleFrom(
    backgroundColor: primaryColor, 
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min, // Esto hace que la fila tenga el tamaño del contenido
    children: [
      Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const Icon(
        Icons.navigate_next, // Cambia esto al ícono que desees
        color: Colors.white, // Cambia esto al color que desees para el ícono
      ),
      const SizedBox(width: 10), // Esto agrega un espacio entre el ícono y el texto
      
    ],
  ),
);
  }
}