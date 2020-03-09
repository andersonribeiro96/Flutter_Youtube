import 'dart:async';

import 'package:FavYout/app/models/video_model.dart';
import 'package:FavYout/app/shared/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class VideosBloc implements BlocBase {
  Api api;
  List<Video> videos;

  final StreamController<List<Video>> _videosController =
      StreamController<List<Video>>();
  Stream get outvideos => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();
    _searchController.stream.listen((_search));
  }

  void _search(String string) async {
    videos = await api.search(string);
    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }
}
