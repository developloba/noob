import 'dart:convert';

import 'package:http/http.dart';
import 'package:noob/data/models/gamemodel.dart';

class Gamerepository {
  String endpoint =
      'https://api.rawg.io/api/games?key=b95eb56d4a2b4331a4849c5e90903598';
  getGames() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      return data.map((e) => Gamemodel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
