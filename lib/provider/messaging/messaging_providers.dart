import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/services/messaging/message_services.dart';

final messageServicesProvider = Provider<FirebaseMessage>((ref) {
  return FirebaseMessage();
});
