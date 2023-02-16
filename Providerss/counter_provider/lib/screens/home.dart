import 'package:counter_provider/screens/counter_page.dart';
import 'package:counter_provider/screens/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Counter Home'),
            onTap: () {
              var route =
                  MaterialPageRoute(builder: (context) => CounterPage());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Settings Home'),
            onTap: () {
              var route =
                  MaterialPageRoute(builder: (context) => SettingPage());
              Navigator.push(context, route);
            },
          )
        ],
      ),
    );
  }
}
