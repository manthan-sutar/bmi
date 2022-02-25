import 'package:flutter/material.dart';
import 'package:todo_app/Apps.dart';
import 'package:todo_app/bmi/src/screens/BMI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const Apps(),
    );
  }
}
