import 'package:hooks_riverpod/hooks_riverpod.dart';

final eyeFocusProvider =
    StateNotifierProvider<EyeFocusNotifier, Map<String, bool>>(
        (ref) => EyeFocusNotifier());

class EyeFocusNotifier extends StateNotifier<Map<String, bool>> {
  EyeFocusNotifier() : super({});

  void setEye(String eyeKey, bool isFocus) {
    state = {...state, eyeKey: isFocus};
  }
}
