import 'dart:convert';

import 'package:base_provider/data_source/api_urls.dart';
import 'package:base_provider/models/video_model.dart';
import 'package:base_provider/resources/logs.dart';
import 'package:base_provider/resources/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

//Todo: ApiServices
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
    var body = json.jsonDecode(response.body);
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
