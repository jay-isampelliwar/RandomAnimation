import 'package:flutter/material.dart';
import 'home_page.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
