import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:quaxly/controllers/register_controller.dart';
import 'package:quaxly/widgets/text_form_field.dart';
import 'package:quaxly/widgets/action_button.dart';
import 'package:get/get.dart';
import 'package:quaxly/widgets/title_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController registerController = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      
      },
      child: Scaffold(
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
                      child: AppText(
                        text: 'register'.tr, 
                        fontSize: 24, 
                        fontWeight: FontWeight.bold,
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
                    AppTextFormField(
                      label: 'confirm_password'.tr,
                      hint: 'confirm_password'.tr,
                      isPassword: true,
                      controller: registerController.confirmPasswordController,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ActionButton(
                        text: 'register'.tr,
                        onTapFunction: () {
                          registerController.registerController;
                        },
                        isFilled: true,
                        hasShadow: true,
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
