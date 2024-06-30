import 'package:flutter/material.dart';
import 'package:suri/components/dialog/info_dialog.dart';

class InformationContainer extends StatelessWidget {
  const InformationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showInfoDialog(context, "Title", "message");
      },
      child: IntrinsicHeight(
          child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.check),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1st Cycle"),
                    Text("Monday, September 25, 2023"),
                  ],
                )
              ],
            ),
            Text("10:30 AM"),
          ],
        ),
      )),
    );
  }
}
