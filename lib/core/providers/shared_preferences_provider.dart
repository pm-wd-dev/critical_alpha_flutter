import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider for SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences provider must be overridden');
});

// Provider for initializing SharedPreferences
final sharedPreferencesInitProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});