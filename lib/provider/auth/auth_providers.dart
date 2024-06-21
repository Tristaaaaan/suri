import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/services/auth/auth_services.dart';

final googleSignInLoading = StateProvider<bool>((ref) => false);

final authServicesProvider = Provider<AuthServices>((ref) {
  return AuthServices();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
