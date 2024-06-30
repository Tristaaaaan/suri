import 'package:flutter/material.dart';

class CycleInfoContainer extends StatelessWidget {
  const CycleInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ripe Coffee Berry",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 16),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                "25",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: Theme.of(context).colorScheme.background,
        ),
      ],
    );
  }
}
