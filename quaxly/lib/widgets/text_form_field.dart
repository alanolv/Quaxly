import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({super.key, this.label, this.hint, this.isPassword = false, required this.controller});

  final String? label;
  final String? hint;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}