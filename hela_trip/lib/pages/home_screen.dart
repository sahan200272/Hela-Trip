import 'package:flutter/material.dart';
import 'package:hela_trip/pages/user_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserProfile(),
              ),
            );
          },
          child: const Text("Go to Profile"),
        ),
      ),
    );
  }
}