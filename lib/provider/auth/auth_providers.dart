import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/services/auth/auth_services.dart';

final googleSignInLoading = StateProvider<bool>((ref) => false);

final authServicesProvider = Provider<AuthServices>((ref) {
  return AuthServices();
});

final requestFirstName = StateProvider.autoDispose<String>((ref) => "");
final requestLastName = StateProvider.autoDispose<String>((ref) => "");
final requestEmail = StateProvider.autoDispose<String>((ref) => "");
final requestPassword = StateProvider.autoDispose<String>((ref) => "");
final requestConfirmPassword = StateProvider.autoDispose<String>((ref) => "");
