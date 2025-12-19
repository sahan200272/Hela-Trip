import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore Test App',
      home: const FirestoreTestPage(),
    );
  }
}

class FirestoreTestPage extends StatelessWidget {
  const FirestoreTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Test'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await FirebaseFirestore.instance.collection('test').add({
                'message': 'Hello Firebase',
                'time': DateTime.now(),
              });
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
