import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of Items'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                items[index],
                style: TextStyle(fontSize: 18),
              ),
            );
          },
        ),
      ),
    );
  }
}
