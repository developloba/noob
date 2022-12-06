import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:noob/data/models/gamemodel.dart';

class Weeklyrepository {
  static final DateTime end = DateTime.now();
  static final DateTime start =
      DateTime.now().subtract(const Duration(days: 7));
  //parses date in a way i can use with the endpoint
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String enddate = formatter.format(end);
  final String startdate = formatter.format(start);
  getendpoint(String startdate, String endate) {
    String base =
        'https://api.rawg.io/api/games?key=b95eb56d4a2b4331a4849c5e90903598&dates=';
    return '$base$startdate,$endate';
  }

  getgames() async {
    Response response = await get(Uri.parse(getendpoint(startdate, enddate)));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      return data.map((e) => Gamemodel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
