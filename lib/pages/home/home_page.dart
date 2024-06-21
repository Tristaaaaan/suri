import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/pages/home/profile_page.dart';
import 'package:suri/provider/auth/user_info_providers.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoStream = ref.watch(userInfoProvider(_auth.currentUser!.uid));

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [Text("Hi Tristan,"), Text("Welcome back")],
        ),
        automaticallyImplyLeading: false,
        actions: [
          userInfoStream.when(
              data: (user) {
                return GestureDetector(
                  onTap: () {
                    ref.read(userNotificationProvider.notifier).state =
                        user.notification;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          imageUrl: user.imageUrl!,
                          name: user.name!,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    backgroundImage: NetworkImage(
                      user.imageUrl!,
                    ),
                  ),
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container())
        ],
      ),
    );
  }
}
