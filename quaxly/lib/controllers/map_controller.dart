import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quaxly/models/navigation_response.dart';

class MapController extends GetxController{

  Rx<NavigationReponse?> response = Rx(null);

  @override
  void onReady() async{
    await fetchRequest();
    super.onReady();
  }


  String request = "https://api.mapbox.com/directions/v5/mapbox/driving/-100.44069%2C20.705261%3B-100.440414%2C20.70769%3B-100.442106%2C20.705283?alternatives=true&geometries=polyline&language=en&overview=simplified&steps=true&notifications=none&access_token=pk.eyJ1Ijoicm9kcmlpdGVwYXR6aSIsImEiOiJjbHJwcDhjMHkwOGo5Mmxsa3BsNWZ2bWgzIn0.ZMfAkCGD-Q4sr4Phb1_RNg";



  Future<void> fetchRequest() async{
    var result = await http.get(Uri.parse(request));

    if(result.statusCode == 200){
      response.value = NavigationReponse.fromJson(jsonDecode(result.body));
    }

  }

  
}