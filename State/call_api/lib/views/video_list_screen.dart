import 'package:call_api/data_api/api_services.dart';
import 'package:call_api/models/video_model.dart';
import 'package:call_api/resources/strings.dart';
import 'package:call_api/views/video_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

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
        child: FutureBuilder<List<VideoModel>?>(
          future: ApiServices().fetchVideoList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(ERROR_DATA_LOADING),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<VideoModel> videoList = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: videoList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Card(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Image.asset(videoList[index].url_photo!),
                        Text(
                          videoList[index].title!,
                          softWrap: true,
                        )
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
        ),
      ),
    );
  }
}
