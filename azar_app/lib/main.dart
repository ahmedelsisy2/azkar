//import 'package:azar_app/screen/home_screen.dart';
import 'package:azar_app/screen/home_screen.dart';
//import 'package:azar_app/screen/sedha_screen.dart';
import 'package:flutter/material.dart';
//import 'package:azar_app/screen/azkar_text_screen.dart';

void main() {
  runApp(const MyAzkarApp());
}

class MyAzkarApp extends StatelessWidget {
  const MyAzkarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق الأذكار',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(), 
    );
  }
}