import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hela_trip/firebase/firebase_init.dart';
import 'package:hela_trip/router/app_router.dart';
import 'package:hela_trip/services/auth_service.dart';
import 'package:hela_trip/pages/user_profile.dart';
import 'package:hela_trip/pages/home_screen.dart';

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
      routerConfig: router,
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
              // Router will automatically redirect to /home screen
              // when authStateProvider updates
            }
          },
        ),
      ),
    );
  }
}
