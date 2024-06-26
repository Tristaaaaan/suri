import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/config/app_config.dart';
import 'package:suri/config/app_environments.dart';
import 'package:suri/firebase/dev/firebase_options.dart';
import 'package:suri/pages/auth/auth_gate.dart';
import 'package:suri/services/messaging/message_services.dart';
import 'package:suri/themes/light_mode.dart';

@pragma('vm:entry-point')
void main() async {
  AppConfig.setEnvironment(Flavors.development);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "suri-dev",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug, //.playIntegrity,
  );

  await FirebaseMessage().initNotifications();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthGate(),
      theme: lightMode,
    );
  }
}
