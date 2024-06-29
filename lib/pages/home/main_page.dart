import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/functions/name_formatter.dart';
import 'package:suri/pages/home/history_page.dart';
import 'package:suri/pages/home/home_page.dart';
import 'package:suri/pages/home/observe_page.dart';
import 'package:suri/pages/home/profile_page.dart';
import 'package:suri/provider/auth/user_info_providers.dart';

final bottomNavProvider = StateProvider.autoDispose<int>((ref) => 0);

List<Widget> pages = [
  const HomePage(),
  const ObservePage(),
  const HistoryPage(),
];

class MainPage extends ConsumerWidget {
  MainPage({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoStream = ref.watch(userInfoProvider(_auth.currentUser!.uid));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfoStream.when(
              data: (data) {
                return Text(
                  "Hi ${formatName(data.name!)},",
                  style: const TextStyle(fontSize: 16),
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container(),
            ),
            const Text("Welcome back", style: TextStyle(fontSize: 16))
          ],
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
            loading: () => Container(),
          )
        ],
      ),
      body: pages[ref.watch(bottomNavProvider)],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(bottomNavProvider),
        onTap: (int index) {
          ref.read(bottomNavProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Observe"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }
}
