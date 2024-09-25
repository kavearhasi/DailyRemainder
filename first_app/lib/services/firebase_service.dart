// lib/services/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addReminder(String day, String time, String activity) async {
    await _db.collection('reminders').add({
      'day': day,
      'time': time,
      'activity': activity,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
