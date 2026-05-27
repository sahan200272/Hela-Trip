import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hela_trip/firebase/firebase_init.dart';
import 'package:hela_trip/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
