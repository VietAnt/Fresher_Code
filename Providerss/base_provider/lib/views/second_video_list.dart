import 'package:base_provider/providers/video_list_provider.dart';
import 'package:base_provider/resources/strings.dart';
import 'package:base_provider/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

//Todo: SecondVideoLsitScreen
class SecondVideoListScreen extends StatelessWidget {
  const SecondVideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(VIDEO_LIST),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Consumer<VideoListProvider>(
          builder: (context, videoListProvider, child) {
            final videoList = videoListProvider.videoList;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Card(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Image.network(videoList[index].url_photo!),
                        Text(
                          videoList[index].title!,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(VideoDetailScreen(videoModel: videoList[index]));
                  },
                );
              },
            );
          },
          child: Container(),
        ),
      ),
    );
  }
}
