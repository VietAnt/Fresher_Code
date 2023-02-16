// ignore_for_file: prefer_const_constructors

import 'package:base_provider/data_source/api_servies.dart';
import 'package:base_provider/models/video_model.dart';
import 'package:base_provider/providers/video_list_provider.dart';
import 'package:base_provider/resources/strings.dart';
import 'package:base_provider/views/second_video_list.dart';
import 'package:base_provider/views/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

//Todo: VideoListScreen
class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final videoListProvider = Provider.of<VideoListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(VIDEO_LIST),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SecondVideoListScreen());
            },
            icon: const Icon(
              Icons.star,
              color: Colors.amberAccent,
            ),
          ),
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.height,
        child: FutureBuilder<List<VideoModel>?>(
          future: ApiServices().fetchVideoList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(ERROR_DATA_LOADING);
            }
            ;
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            ;
            List<VideoModel> videoList = snapshot.data!;
            videoListProvider.updateVideoList(videoList: videoList);
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
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
        ),
      ),
    );
  }
}
