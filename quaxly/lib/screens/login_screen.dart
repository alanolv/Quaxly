import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quaxly/controllers/login_controller.dart';
import 'package:quaxly/screens/register_screen.dart';
import 'package:quaxly/widgets/action_button.dart';
import 'package:quaxly/widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back
            ),
            onPressed: (){
              Get.back();
            },
          ),
        ),
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
                    color: const Color.fromARGB(255, 127, 225, 103).withOpacity(0.3)
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
              Form(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      AppTextFormField(
                        label: 'email'.tr,
                        hint: 'enter_your_email'.tr,
                        controller: loginController.emailController,
                      ),
                      AppTextFormField(
                        label: 'password'.tr,
                        hint: 'enter_your_password'.tr,
                        controller: loginController.emailController,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ActionButton(
                          text: 'login'.tr,
                          onTapFunction: (){
                            //
                          },
                          isFilled: true,
                          hasShadow: true,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}