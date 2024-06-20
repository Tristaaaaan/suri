import 'package:flutter/material.dart';

class ProfileSettingsContainer extends StatelessWidget {
  final bool withSwitch;
  final String title;
  final IconData icon;
  const ProfileSettingsContainer({
    super.key,
    required this.withSwitch,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                inactiveThumbColor: Theme.of(context).colorScheme.tertiary,
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
                value: true,
                onChanged: (value) {
                  print(value);
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
