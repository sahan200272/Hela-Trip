import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hela_trip/models/user_model.dart';
import 'package:hela_trip/providers/auth_providers.dart';
import 'package:hela_trip/services/user_service.dart';

final userServiceProvider = Provider<UserService>((ref) => UserService());

final currentUserProvider = StreamProvider<AppUser?>((ref) {
  final authUser = ref.watch(authStateProvider).valueOrNull;
  if (authUser == null) return Stream.value(null);
  return ref.watch(userServiceProvider).getUser(authUser.uid);
});
