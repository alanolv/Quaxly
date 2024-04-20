import 'package:flutter/material.dart';

import 'package:quaxly/widgets/title_text.dart';
import 'package:get/get.dart';
import 'package:quaxly/widgets/action_short_button.dart';

class TrackCard extends StatefulWidget {
  final String imagePath;
  final String deliveryId;
  final bool isDelivered;
  final Function() onTapFunction;

  const TrackCard(
      {Key? key,
      required this.imagePath,
      required this.deliveryId,
      required this.onTapFunction,
      this.isDelivered = false})
      : super(key: key);

  @override
  State<TrackCard> createState() => _TrackCardState();
}

class _TrackCardState extends State<TrackCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(93, 23, 23, 23),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          widget.imagePath,
          height: 200,
          width: 130,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'delivery_truck_info'.tr,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              AppText(
                text: 'delivery_id'.tr + widget.deliveryId,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                text: 'current_status'.tr +
                    (widget.isDelivered ? 'delivered'.tr : 'in_transit'.tr),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    child: GestureDetector(
                      onTap: () {
                        // Agrega la lógica del evento de toque aquí
                      },
                      child: Image.asset(
                        'assets/images/Route-button.png',
                        width: 86,
                        height: 83,
                      ),
                    ),
                  ),
                  ActionShortButton(
                        text: 'deliver'.tr, 
                        onTapFunction: widget.onTapFunction, 
                        )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
