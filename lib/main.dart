import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page.dart';

void main() {
  runApp(ProviderScope(child: PinoApp()));
}

class PinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '삐노',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(), // 네비게이션이 포함된 메인 페이지
    );
  }
}
