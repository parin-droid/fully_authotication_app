import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fully_authotication_app/models/songs_model.dart';
import 'package:http/http.dart' as http;

class SongProvider with ChangeNotifier {
  SongModel? songModel;

  Future<bool> getSongList() async {
    final response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/parin-droid/fully_authotication_app/master/Songs.json"));
    print(response.body);
    if (response.statusCode == 200) {
      var parseData = jsonDecode(response.body);
      if (parseData != null) {
        songModel = SongModel.fromJson(parseData);
        return true;
      }
      return false;
    }
    return false;
  }
}
