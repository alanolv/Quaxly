import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quaxly/const/messages.dart';
import 'package:quaxly/screens/welcome_screen.dart';

import 'screens/login_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quaxly',
      translations: Messages(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: const Locale('es', 'MX'),
      home: const WelcomeScreen(),
    );
  }
}