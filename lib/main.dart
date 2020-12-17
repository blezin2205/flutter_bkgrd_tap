import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _randomOpacity = 1.0;
  Random random = new Random();
  Color get randomColor {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(_randomOpacity);
}

  void _reloadView() {
    setState(() => _randomOpacity = random.nextDouble() );
    print(_randomOpacity);
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => _reloadView(),
      child: Scaffold(
        backgroundColor: randomColor,
        appBar: AppBar(
          title: Text("Random Background App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hex color for random background:',
                style: TextStyle(
                    color: Colors.white, fontSize: 18),
              ),
              Text(
                randomColor.toString().replaceAll("Color", "",)
                    .replaceAll("(", "")
                  .replaceAll(")", ""),
                style: TextStyle(
                  color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}