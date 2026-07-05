import 'package:flutter/material.dart';
import 'design_system.dart';
import 'entry_guard_screen.dart';

void main() {
  runApp(const SecureStoreApp());
}

class SecureStoreApp extends StatelessWidget {
  const SecureStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecureStore',
      debugShowCheckedModeBanner: false,
      theme: getDarkTheme(),
      home: const EntryGuardScreen(),
    );
  }
}
