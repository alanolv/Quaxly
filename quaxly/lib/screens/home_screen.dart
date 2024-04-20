import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quaxly/controllers/home_controller.dart';
import 'package:quaxly/widgets/title_text.dart';
import 'package:quaxly/widgets/track_card.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                      color: const Color.fromARGB(255, 127, 225, 103)
                          .withOpacity(0.3)),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -100),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white, // Color del borde
                      width: 10, // Ancho del borde
                    ),
                    shape: BoxShape.circle, // Forma del borde
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 200,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(60, -160),
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle, // Forma del borde
                    ),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 46,
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: Column(
                    children: [
                      Transform.translate(
                        offset:const Offset(0, -145), // Mover 20 píxeles hacia arriba
                        child: Align(
                          alignment: Alignment
                              .centerLeft, // Alinea el texto a la izquierda
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: AppText(
                              text: 'live_tracking'.tr,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -125),
                        child: const TrackCard(
                        imagePath: 'assets/images/package.png',
                        deliveryId: '123456',
                        
                      
                      
                      )
                      ),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
