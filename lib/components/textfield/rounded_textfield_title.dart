import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/provider/components/eye_focus_state_notifier.dart';

class RoundedTextField extends ConsumerWidget {
  final String hinttext;

  final TextEditingController controller;
  final bool? withButton;

  final String? eyeKey;

  const RoundedTextField({
    super.key,
    required this.hinttext,
    required this.controller,
    this.withButton = false,
    this.eyeKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final show = ref.watch(eyeFocusProvider)[eyeKey] ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          TextField(
            obscureText: show ? true : false,
            minLines: 1,
            maxLines: 1,
            controller: controller,
            decoration: InputDecoration(
                suffixIcon: withButton!
                    ? IconButton(
                        onPressed: () {
                          final signInNotifier =
                              ref.read(eyeFocusProvider.notifier);
                          if (show) {
                            signInNotifier.setEye(eyeKey!, false);
                          } else {
                            signInNotifier.setEye(eyeKey!, true);
                          }
                        },
                        icon: show
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.remove_red_eye),
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Theme.of(context).colorScheme.background,
                filled: true,
                hintText: hinttext,
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary)),
          ),
        ],
      ),
    );
  }
}
