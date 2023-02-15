//Todo: ApiServices
import 'dart:convert';

import 'package:call_api/data_api/api_urls.dart';
import 'package:call_api/models/video_model.dart';
import 'package:call_api/resources/logs.dart';
import 'package:call_api/resources/strings.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //fetch all video
  Future<List<VideoModel>?> fetchVideoList() async {
    List<VideoModel> videoList = [];
    var videoListUrl = ApiUrls.VIDEO_URL;
    var response;
    //http
    try {
      response = await http.get(videoListUrl);
    } catch (e) {
      print(ERROR_DOWNLOADING);
    }
    var body = json.decode(response.body);
    Log().printJson(json: body);
    if (body['code'] == 'sucess') {
      List jsonList = body['list'];
      for (var json in jsonList) {
        VideoModel videoModel = VideoModel.fromJson(json);
        videoList.add(videoModel);
      }
    }
    return videoList;
  }
}
