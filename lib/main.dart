import 'package:flutter/material.dart';

void main() {
  // Ensure all bindings are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      theme: ThemeData(
        // Optional: set default font family
        fontFamily: 'Lobster',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontFamily: 'Lobster', // use custom font
              fontSize: 32,
              color: Colors.deepPurple, // custom color
            ),
          ),
        ),
      ),
    );
  }
}
