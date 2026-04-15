import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/main_screen.dart';

void main() => runApp(const MoMindApp());

class MoMindApp extends StatelessWidget {
  const MoMindApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: momindTheme,
      home: const MainScreen(),
    );
  }
}
