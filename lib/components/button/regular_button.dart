import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suri/provider/auth/auth_providers.dart';
import 'package:suri/provider/components/loading_state_notifier.dart';

class RegularButton extends ConsumerWidget {
  final bool? withIcon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String buttonKey;
  final bool? withoutLoading;
  final void Function()? onTap;
  const RegularButton({
    super.key,
    this.withIcon = true,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.buttonKey,
    this.withoutLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(googleSignInLoadingProvider)[buttonKey] ?? false;
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: withoutLoading!
              ? onTap
              : isLoading
                  ? null
                  : () async {
                      final signInNotifier =
                          ref.read(googleSignInLoadingProvider.notifier);

                      signInNotifier.setLoading(buttonKey, true);
                      ref
                          .read(authServicesProvider)
                          .signInWithGoogle(ref, context);
                      // await Future.delayed(const Duration(seconds: 10));
                      signInNotifier.setLoading(buttonKey, false);
                    },
          child: Row(
            children: [
              if (withIcon == true)
                SvgPicture.asset(
                  'assets/icons/google-color_svgrepo.com.svg',
                  height: 20,
                  width: 20,
                ),
              Expanded(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: withIcon == true
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.background,
                      ))
                    : Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: withIcon == true
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: textColor,
                        ),
                      ),
              ),
              if (withIcon == true)
                const SizedBox(
                  width: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
