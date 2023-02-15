// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:state_learn/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
