import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Styling Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Styled Texts'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bold Text',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Italic Text',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Underlined Text',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Strikethrough Text',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Custom Font Size and Color',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
