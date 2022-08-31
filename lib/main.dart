import 'package:behance/app_theme.dart';
import 'package:behance/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Dashboard(),
      theme: AppTheme.themeDataLight,
      debugShowCheckedModeBanner: false,
    );
  }
}
