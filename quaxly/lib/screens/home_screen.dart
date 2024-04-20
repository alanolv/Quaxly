import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quaxly/const/colors.dart';
import 'package:quaxly/screens/login_screen.dart';
import 'package:quaxly/screens/register_screen.dart';
import 'package:quaxly/widgets/action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                      color: const Color.fromARGB(255, 127, 225, 103)
                          .withOpacity(0.3)),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -100),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white, // Color del borde
                      width: 10, // Ancho del borde
                    ),
                    shape: BoxShape.circle, // Forma del borde
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 200,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(60, -160),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle, // Forma del borde
                  ),
                  child: Icon(
                    Icons.settings,
                    color: primaryColor,
                    size: 46,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
