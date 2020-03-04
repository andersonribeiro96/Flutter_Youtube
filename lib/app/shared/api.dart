import 'dart:convert';
import 'package:FavYout/app/models/video_model.dart';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyBHZ6sSQO-0KPcg50bT2TE7SMKbWAAPR2Q";

class Api {
  search(String search) async {
    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");
  }

  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<Video> videos = decoded["items"].map<Video>((mapvideo) {
        return Video.fromJson(mapvideo);
      }).toList();

      return videos;
    } else {
      throw Exception("Failed to load Videos");
    }
  }
}
