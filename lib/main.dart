import 'package:flutter/material.dart';

import 'package:testing_model/home/home_injection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeInjection.injection(),
      theme: ThemeData.dark(),
    );
  }
}
