import 'package:base_provider/providers/video_list_provider.dart';
import 'package:base_provider/views/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoListProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: VideoListScreen(),
      ),
    );
  }
}
