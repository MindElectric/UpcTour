import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upc_tour/models/lugar.dart';
import 'package:http/http.dart' as http;

class LugaresService extends ChangeNotifier {
  final String _baseUrl = "upc-tour-default-rtdb.firebaseio.com";

  final List<Place> places = [];
  bool isLoading = true;

  LugaresService() {
    loadLugar();
  }

  //

  Future<List<Place>> loadLugar() async {
    isLoading = true;
    //notifyListeners();

    final url = Uri.https(_baseUrl, "lugares.json");
    final resp = await http.get(url);

    final Map<String, dynamic> placeMap = json.decode(resp.body);

    placeMap.forEach((key, value) {
      final tempPlace = Place.fromMap(value);
      tempPlace.plId = key;
      places.add(tempPlace);
    });
    //print(places[0].nombre);
    isLoading = false;
    notifyListeners();
    return places;
  }
}
