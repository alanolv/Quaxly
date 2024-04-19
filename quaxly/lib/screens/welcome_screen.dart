import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quaxly/widgets/action_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/repartidor.png'),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), 
                child: Container(
                  color: Color.fromARGB(255, 127, 225, 103).withOpacity(0.3)
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -100),
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                  ),
                ),
              ),
            ),
            ActionButton(
              text: "Log in with your account",
              onTapFunction: (){},
              leadingIcon: Icons.chevron_right,
            )
          ],
        ),
      ),
    );
  }
}