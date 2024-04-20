import 'package:flutter/material.dart';
import 'package:quaxly/controllers/register_controller.dart';
import 'package:quaxly/widgets/text_form_field.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController registerController = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 160,
            height: 200,
            margin: const EdgeInsets.only(top: 150),
            child: ClipRRect(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
          ), // Text
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50,), //
                    child: Text(
                      'create_your_account'.tr,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AppTextFormField(
                    label: 'enter_your_email'.tr,
                    hint: 'example_email'.tr,
                    controller: registerController.emailController,
                  ),
                  AppTextFormField(
                    label: 'enter_your_password'.tr,
                    hint: 'enter_your_password'.tr,
                    isPassword: true,
                    controller: registerController.passwordController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
