import 'package:flutter/material.dart';
import '../widgets/nav_drawer.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const NavDrawer(),
      body: const Center(
        child: Text('Settings Page'),
      ),
    );
  }
}