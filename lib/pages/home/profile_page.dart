import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/components/container/profile_settings.dart';
import 'package:suri/functions/modify_profile_image_size.dart';
import 'package:suri/pages/home/about_page.dart';
import 'package:suri/pages/home/help_page.dart';
import 'package:suri/provider/auth/auth_providers.dart';
import 'package:suri/provider/auth/user_info_providers.dart';

class ProfilePage extends ConsumerWidget {
  final String imageUrl;
  final String name;

  const ProfilePage({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    backgroundImage: NetworkImage(
                      modifyImageUrl(imageUrl, 's1080'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Settings",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ProfileSettingsContainer(
              withSwitch: true,
              title: "Notification",
              icon: Icons.notifications,
              ref: ref,
              notification: ref.watch(userNotificationProvider),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Utilities",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            ProfileSettingsContainer(
              withSwitch: false,
              title: "About",
              icon: Icons.info,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
            ProfileSettingsContainer(
              withSwitch: false,
              title: "Help",
              icon: Icons.help,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpPage(),
                  ),
                );
              },
            ),
            ProfileSettingsContainer(
              withSwitch: false,
              title: "Logout",
              icon: Icons.logout,
              onTap: () async {
                await ref.read(authServicesProvider).signOutAccount(ref);

                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
