import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/ui/home.dart';

void main() {
  runApp(
    AnnotatedRegion<SystemUiOverlayStyle>(
      child: MyApp(),
      value: SystemUiOverlayStyle(statusBarColor: Colors.white),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}
