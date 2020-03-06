import 'dart:async';
import 'package:FavYout/app/models/video_model.dart';
import 'package:FavYout/app/shared/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class VideoBloc implements BlocBase {
  Api api;
  List<Video> videos;

  final StreamController<List<Video>> _videosController =
      StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  VideoBloc() {
    api = Api();

    _searchController.stream.listen((_search));
  }

  void _search(String search) async {
    videos = await api.search(search);
    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }
}
