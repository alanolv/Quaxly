import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}