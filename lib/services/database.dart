import 'dart:convert';

import 'package:coffeapp/models/coffeModel.dart';
import 'package:flutter/services.dart';

class Database {
  Future<List<CoffeModel>> getCoffes() async {
    try {
      String coffes = await rootBundle.loadString("assets/json/coffes.json");

      List<CoffeModel> query = (jsonDecode(coffes) as List)
          .map((e) => CoffeModel.fromJson(e))
          .toList();
      print(555);
      print(query.length);
      return query;
    } catch (e) {
      return [];
    }
  }
}
