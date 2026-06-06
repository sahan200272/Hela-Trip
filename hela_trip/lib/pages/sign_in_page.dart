import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hela_trip/providers/auth_providers.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF549464),
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.login),
          label: const Text('Continue with Google'),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            final user = await ref
                .read(googleAuthServiceProvider)
                .signInWithGoogle();
            if (user != null) {
              messenger.showSnackBar(
                const SnackBar(content: Text('Sign-in successful')),
              );
            }
          },
        ),
      ),
    );
  }
}
