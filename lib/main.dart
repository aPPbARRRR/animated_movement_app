import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MovingPlace(),
    );
  }
}

class MovingPlace extends StatefulWidget {
  const MovingPlace({super.key});

  @override
  State<MovingPlace> createState() => _MovingPlaceomeState();
}

class _MovingPlaceomeState extends State<MovingPlace> {
  double testW = 0;
  double testH = 0;

  double testW2 = 0;
  double testH2 = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      testW2 = 800;
      testH2 = 500;
    }).then((value) {
      Future.delayed(Duration(seconds: 7)).then((value) {
        testW2 = 100;
        testH2 = 900;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;
    final double unitW = screenW / 10;
    final double unitH = screenH / 10;
    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        print(details.localPosition);
        testW = details.localPosition.dx - unitW / 2;
        testH = details.localPosition.dy - unitH / 2;

        setState(() {});
      },
      child: Container(
        width: screenW,
        height: screenH,
        color: Colors.red,
        child: Stack(children: [
          AnimatedPositioned(
              left: testW,
              top: testH,
              child: Container(
                width: unitW,
                height: unitH,
                color: Colors.green,
              ),
              duration: Duration(seconds: 1)),
          AnimatedPositioned(
              left: testW2,
              top: testH2,
              child: Container(
                width: unitW,
                height: unitH,
                color: Colors.purple,
              ),
              duration: Duration(seconds: 4)),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: unitW,
              height: unitH,
              color: Colors.black,
            ),
          ),
          Positioned(
            left: unitW * 9,
            bottom: unitH * 9,
            child: Container(
              width: unitW,
              height: unitH,
              color: Colors.yellow,
            ),
          )
        ]),
      ),
    );
  }
}
