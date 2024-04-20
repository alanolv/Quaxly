import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quaxly/screens/register_screen.dart';
import 'package:quaxly/widgets/action_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
                    color: Color.fromARGB(255, 127, 225, 103).withOpacity(0.3)
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -100),
                child: SizedBox(
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 200,
                    ),
                  ),
                ),
              ),
              ActionButton(
                text: 'login_with_your_account'.tr,
                onTapFunction: (){},
                leadingIcon: Icons.chevron_right,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Divider()
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      child: Text(
                      'or'.tr,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 180, 180, 180),
                        fontSize: 20,
                      ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                      child: Divider()
                    ),
                  ],
                ),
              ),
              ActionButton(
                text: 'register'.tr,
                onTapFunction: (){
                  Get.to(() => RegisterScreen());
                },
                leadingIcon: Icons.chevron_right,
                isFilled: true,
                hasShadow: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}