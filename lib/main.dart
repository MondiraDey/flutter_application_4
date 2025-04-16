import 'package:flutter/material.dart';

void main() {
  runApp(DateTimePickerApp());
}

class DateTimePickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date & Time Picker',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: DateTimePickerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  @override
  _DateTimePickerScreenState createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String get formattedDate {
    if (selectedDate == null) return "No date selected";
    return "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
  }

  String get formattedTime {
    if (selectedTime == null) return "No time selected";
    return selectedTime!.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Date & Time')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.calendar_today),
              label: Text("Pick Date"),
              onPressed: _pickDate,
            ),
            SizedBox(height: 10),
            Text("Selected Date: $formattedDate"),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(Icons.access_time),
              label: Text("Pick Time"),
              onPressed: _pickTime,
            ),
            SizedBox(height: 10),
            Text("Selected Time: $formattedTime"),
          ],
        ),
      ),
    );
  }
}

