import 'package:flutter/material.dart';
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
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: 160,
              height: 200,
              margin: const EdgeInsets.only(top: 50),
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
                        text: 'create_your_account'.tr, 
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
                    Container(
                      margin: const EdgeInsets.only(top: 20,),
                      alignment: Alignment.center,//
                      child: AppText(
                        text: 'do_you_have_account'.tr, 
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: AppText(
                          text: 'login_with_your_account'.tr, 
                          fontSize: 16, 
                          fontWeight: FontWeight.w300,
                        ),
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
