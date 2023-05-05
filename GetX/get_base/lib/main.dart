// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class CounterController extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter-GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(counterController.count.toString()),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.to(OtherScreen()),
              child: Container(
                height: 40,
                width: 120,
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    Text('Other Screen'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  OtherScreen({super.key});
  final CounterController counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(counterController.count.toString())),
            TextButton(
              onPressed: () => Get.to(Home()),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
