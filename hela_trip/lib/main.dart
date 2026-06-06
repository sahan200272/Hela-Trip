import 'package:flutter/material.dart';
import 'package:hela_trip/auth_gate.dart';
import 'package:hela_trip/firebase/firebase_init.dart';
import 'package:hela_trip/router/app_router.dart';

Future<void> main() async {

  // do not run flutter widget code until flutter framework fully booted
  WidgetsFlutterBinding.ensureInitialized();

  // make connection brtween flutter app and firebsae
  await initializeFirebase();
  runApp(const ProviderScope(child: HelaTripApp()));
}

class HelaTripApp extends ConsumerWidget {
  const HelaTripApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Hela Trip',
      home: AuthGate(clientId: "165574279956-di8m647fn6i1iha3vru3t84dqnts5tsm.apps.googleusercontent.com"),
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
