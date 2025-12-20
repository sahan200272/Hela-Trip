import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:hela_trip/firebase/firebase_init.dart';
import 'package:hela_trip/services/firestore_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore Test App',
      home: FirestoreTestPage(),
    );
  }
}

class FirestoreTestPage extends StatelessWidget {
  FirestoreTestPage({super.key});

  // Create service instance
  final FirebaseService _firebaseService = 
        FirebaseService(firestore: FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Test'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await _firebaseService.addMessage();
              log('Data sent to Firestore successfully!');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data sent to Firestore ✅')),
              );
            } catch (e) {
              log('Error sending data: $e');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to send data ❌')),
              );
            }
          },
          child: const Text('Send Test Data'),
        ),
      ),
    );
  }
}
