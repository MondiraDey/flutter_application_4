import 'package:flutter/material.dart';

void main() {
  runApp(MySettingsApp());
}

class MySettingsApp extends StatefulWidget {
  @override
  _MySettingsAppState createState() => _MySettingsAppState();
}

class _MySettingsAppState extends State<MySettingsApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: SettingsScreen(
        isDarkMode: _isDarkMode,
        onToggleDarkMode: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggleDarkMode;

  const SettingsScreen({
    required this.isDarkMode,
    required this.onToggleDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            subtitle: Text('Enable or disable dark theme'),
            value: isDarkMode,
            onChanged: onToggleDarkMode,
            secondary: Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
