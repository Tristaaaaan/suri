import 'package:flutter/material.dart';
import 'package:suri/components/container/cycle_info_container.dart';

void showInfoDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        "1st Cycle Detection Result",
        style: TextStyle(
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      content: const IntrinsicHeight(
        child: Column(children: [
          CycleInfoContainer(),
          CycleInfoContainer(),
          CycleInfoContainer(),
          CycleInfoContainer(),
        ]),
      ),
    ),
  );
}
