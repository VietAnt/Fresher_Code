import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_call_api/provider/todo_provider.dart';
import 'package:provider_call_api/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: const MaterialApp(
          home: HomePage(),
        ));
  }
}
