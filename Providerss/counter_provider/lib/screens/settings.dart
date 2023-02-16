import 'package:counter_provider/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switch'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: provider.toggleTheme,
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}
