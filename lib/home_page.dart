import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height = 200;
  double width = 200;
  List<Color> colors = [Colors.red, Colors.yellow];
  List<Alignment> aliment = [
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
  ];
  Alignment beginAlignment = Alignment.center;
  Alignment endAlignment = Alignment.centerLeft;
  double pos = 100;
  double borderRadius = 20;

  void _makeAnimation() {
    setState(() {
      height = Random().nextInt(200) + 20;
      width = Random().nextInt(200) + 20;
      pos = Random().nextInt(300) + 100;
      borderRadius = Random().nextInt(50) + 5;
      for (int i = 0; i < colors.length; i++) {
        colors[i] = getColor();
      }
      beginAlignment = aliment[Random().nextInt(aliment.length - 1)];
      endAlignment = getRandomPos();
    });
  }

  Alignment getRandomPos() {
    while (beginAlignment == endAlignment) {
      endAlignment = aliment[Random().nextInt(aliment.length - 1)];
    }

    return endAlignment;
  }

  Color getColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(top: pos),
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                  begin: beginAlignment, end: endAlignment, colors: colors),
            ),
            duration: const Duration(milliseconds: 500),
          ),
          const Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {
                _makeAnimation();
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 100),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200]!,
                  shape: BoxShape.circle,
                  boxShadow: [
                    const BoxShadow(
                      offset: Offset(-4, -4),
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      offset: const Offset(4, 4),
                      color: Colors.grey[400]!,
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "MOVE",
                    style: TextStyle(fontFamily: "RubikMoon", fontSize: 30),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
