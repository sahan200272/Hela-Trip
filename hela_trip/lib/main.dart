import 'package:flutter/material.dart';
import 'package:hela_trip/firebase/firebase_init.dart';
import 'package:hela_trip/pages/user_profile.dart';
import 'package:hela_trip/services/auth_service.dart';

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
      title: 'Hela Trip',
      home: GoogleSignUpPage(),
    );
  }
}

class GoogleSignUpPage extends StatelessWidget {
  GoogleSignUpPage({super.key});

  final GoogleAuthService _authService = GoogleAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign-in")),
      body: Center(
        child: ElevatedButton.icon(
          label: const Text("Using Google"),
          onPressed: () async {
            final user = await _authService.signInWithGoogle();

            if (user != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sign-in successful")),
              );
            }
// navigate to the user profile after login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (context) => UserProfile()
              ),
            );
          },
        ),
      ),
    );
  }
}
