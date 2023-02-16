import 'package:base_provider/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoListProvider with ChangeNotifier {
  List<VideoModel> videoList = [];

  //Todo: Update
  updateVideoList({
    required videoList,
  }) {
    this.videoList = videoList;
    notifyListeners();
  }
}
