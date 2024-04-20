import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quaxly/widgets/error_snackbar.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> performLoginAction() async{
    if(passwordController.text.isNotEmpty && emailController.text.isNotEmpty){

    }
    else{
      showErrorSnackbar('Error al iniciar sesión', 'Hay campos vacios. Por favor, llena todos los campos.');
    }
  }
}