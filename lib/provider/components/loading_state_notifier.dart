//
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleSignInLoadingProvider =
    StateNotifierProvider<GoogleSignInLoadingNotifier, Map<String, bool>>(
        (ref) => GoogleSignInLoadingNotifier());

class GoogleSignInLoadingNotifier extends StateNotifier<Map<String, bool>> {
  GoogleSignInLoadingNotifier() : super({});

  void setLoading(String buttonKey, bool isLoading) {
    state = {...state, buttonKey: isLoading};
  }
}
