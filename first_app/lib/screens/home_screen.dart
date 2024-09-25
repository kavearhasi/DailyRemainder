// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/dropdown_widget.dart';
import '../services/firebase_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedDay;
  String? selectedTime;
  String? selectedActivity;
  final List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  final List<String> activities = ['Wake up', 'Go to gym', 'Breakfast', 'Meetings', 'Lunch', 'Quick nap', 'Go to library', 'Dinner', 'Go to sleep'];

  FirebaseService firebaseService = FirebaseService();

  void _submitReminder() {
    if (selectedDay != null && selectedTime != null && selectedActivity != null) {
      firebaseService.addReminder(selectedDay!, selectedTime!, selectedActivity!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reminder Added')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Reminder App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropDownWidget(
              title: 'Select Day',
              items: days,
              onChanged: (value) {
                setState(() {
                  selectedDay = value;
                });
              },
            ),
            DropDownWidget(
              title: 'Select Time',
              items: List.generate(24, (index) => '$index:00'),
              onChanged: (value) {
                setState(() {
                  selectedTime = value;
                });
              },
            ),
            DropDownWidget(
              title: 'Select Activity',
              items: activities,
              onChanged: (value) {
                setState(() {
                  selectedActivity = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitReminder,
              child: Text('Set Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}
