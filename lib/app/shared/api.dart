import 'dart:convert';
import 'package:FavYout/app/models/video_model.dart';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyCzS8VkpBmAO3Y9m650lDcATZuugRIVu8Y";

class Api {
  search(String search) async {
    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");

    return decode(response);
  }

  decode(http.Response response) {
    if (response.statusCode == 200) {
      print("Api Code ${response.statusCode.toString()}");
      var decoded = json.decode(response.body);

      List<Video> videos = decoded["items"].map<Video>((value) {
        return Video.fromJson(value);
      }).toList();
      return videos;
    } else {
      print("Api Code Error ${response.statusCode.toString()}");
    }
  }
}
