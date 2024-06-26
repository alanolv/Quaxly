import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quaxly/const/messages.dart';
import 'package:quaxly/screens/home_screen.dart';
import 'package:quaxly/screens/map_screen.dart';
import 'package:quaxly/screens/welcome_screen.dart';
import 'package:quaxly/widgets/upload_photo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quaxly',
      translations: Messages(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent),
        useMaterial3: true,
      ),
      locale: const Locale('es', 'MX'),
      home: const HomeScreen(),
    );
  }
}
