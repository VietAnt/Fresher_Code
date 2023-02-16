import 'package:base_provider/models/video_model.dart';
import 'package:base_provider/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoDetailScreen extends StatelessWidget {
  final VideoModel videoModel;
  VideoDetailScreen({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(VIDEO_DETAIL),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(videoModel.url_photo!),
            Text(
              videoModel.title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              videoModel.description!,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
