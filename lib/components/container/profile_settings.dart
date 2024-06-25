import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/provider/auth/user_info_providers.dart';

class ProfileSettingsContainer extends StatelessWidget {
  final bool withSwitch;
  final String title;
  final IconData icon;
  final bool? notification;

  final void Function()? onTap;
  final WidgetRef? ref;
  const ProfileSettingsContainer({
    super.key,
    required this.withSwitch,
    required this.title,
    required this.icon,
    this.onTap,
    this.notification,
    this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1, // Changed from 'thickness' to 'width'
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            if (withSwitch)
              Switch(
                inactiveThumbColor: Theme.of(context).colorScheme.primary,
                activeColor: Theme.of(context).colorScheme.primary,
                trackOutlineColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.orange.withOpacity(.48);
                    }
                    if (states.contains(MaterialState.selected)) {
                      return null; // Make the outline disappear when the Switch is active
                    }
                    return Theme.of(context).colorScheme.primary;
                  },
                ),
                value: ref!.watch(userNotificationProvider),
                onChanged: (value) async {
                  await ref!
                      .read(userInfoServicesProvider)
                      .configureUserNotification(value);

                  if (ref!.watch(userNotificationProvider) == value) {
                    ref!.read(userNotificationProvider.notifier).state = !value;
                  } else {
                    ref!.read(userNotificationProvider.notifier).state = value;
                  }
                },
              ),
            if (!withSwitch)
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.secondary,
              ),
          ],
        ),
      ),
    );
  }
}
