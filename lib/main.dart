import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(AnimatedBoxApp());

class AnimatedBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedBoxScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimatedBoxScreen extends StatefulWidget {
  @override
  _AnimatedBoxScreenState createState() => _AnimatedBoxScreenState();
}

class _AnimatedBoxScreenState extends State<AnimatedBoxScreen> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void _changeContainer() {
    final random = Random();
    setState(() {
      _width = random.nextDouble() * 200 + 50;
      _height = random.nextDouble() * 200 + 50;
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextDouble() * 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeContainer,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
