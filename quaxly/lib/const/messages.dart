import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'create_your_account': 'Create your account',
          'login_with_your_account': 'Log in with your account',
        },
        'es_MX': {
          'create_your_account': 'Crea tu cuenta',
          'login_with_your_account': 'Inicia sesión con tu cuenta',
        },
      };
}