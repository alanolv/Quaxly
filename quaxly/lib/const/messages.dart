import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'create_your_account': 'Create your account',
          'login_with_your_account': 'Log in with your account',
          'or' : 'Or',
          'register' : 'Sign up',
          'enter_your_name': 'Enter your email',
          'example_email': 'Example@gmail.com',
          'enter_your_password': 'Enter your password',
        },
        'es_MX': {
          'create_your_account': 'Crea tu cuenta',
          'login_with_your_account': 'Inicia sesión con tu cuenta',
          'or' : 'O',
          'register' : 'Regístrate',
          'enter_your_email': 'Ingresa tu correo',
          'example_email': 'Ejemplo@gmail.com',
          'enter_your_password': 'Ingresa tu contraseña',
        },
      };
}