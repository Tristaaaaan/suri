import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/components/container/profile_settings.dart';
import 'package:suri/provider/auth/auth_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                CircleAvatar(
                    radius: 60,
                    backgroundColor: Theme.of(context).colorScheme.secondary),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Juan Dela Cruz",
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
                  fontSize: 16, color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const ProfileSettingsContainer(
            withSwitch: true,
            title: "Notification",
            icon: Icons.notifications,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Utilities",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          const ProfileSettingsContainer(
            withSwitch: false,
            title: "About",
            icon: Icons.info,
          ),
          const ProfileSettingsContainer(
            withSwitch: false,
            title: "Help",
            icon: Icons.help,
          ),
          ProfileSettingsContainer(
            withSwitch: false,
            title: "Logout",
            icon: Icons.logout,
            onTap: () async {
              await ref.read(authServicesProvider).signOut();

              print("LOGOUT");
            },
          )
        ],
      ),
    );
  }
}
