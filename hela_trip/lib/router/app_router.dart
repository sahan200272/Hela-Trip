import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hela_trip/pages/discover_home.dart';
import 'package:hela_trip/pages/sign_in_page.dart';
import 'package:hela_trip/pages/user_profile.dart';
import 'package:hela_trip/pages/home_screen.dart';
import 'package:hela_trip/providers/auth_providers.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/sign-in',
    refreshListenable: _AuthRefreshNotifier(ref),
    redirect: (context, state) {
      final loggedIn = auth.valueOrNull != null;
      final atSignIn = state.matchedLocation == '/sign-in';
      if (!loggedIn) return atSignIn ? null : '/sign-in';
      if (atSignIn) return '/discover';
      return null;
    },
    routes: [
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/discover',
        builder: (context, state) => const DiscoverHome(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const UserProfile(),
      ),
    ],
  );
});

class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(Ref ref) {
    ref.listen(authStateProvider, (_, __) => notifyListeners());
  }
}
