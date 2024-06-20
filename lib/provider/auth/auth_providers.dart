import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/services/auth/auth_services.dart';

final googleSignInLoading = StateProvider<bool>((ref) => false);

final authServicesProvider = Provider<AuthServices>((ref) {
  return AuthServices();
});
