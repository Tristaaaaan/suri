import 'package:flutter/material.dart';
import 'package:suri/components/container/result_box.dart';
import 'package:suri/model/data_model.dart';

void showInfoDialog(
  BuildContext context,
  ClassificationModel data,
  String time,
  String? image,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text(
        time,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      content: IntrinsicHeight(
        child: Column(
          children: [
            if (image != null)
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ResultBox(
                    type: "Ripe",
                    count: data.ripe.toString(),
                  ),
                  VerticalDivider(
                      thickness: 1,
                      color: Theme.of(context).colorScheme.primary),
                  ResultBox(
                    type: "Unripe",
                    count: data.unripe.toString(),
                  ),
                  VerticalDivider(
                      thickness: 1,
                      color: Theme.of(context).colorScheme.primary),
                  ResultBox(
                    type: "Infested",
                    count: data.infectedBerry.toString(),
                  ),
                  VerticalDivider(
                      thickness: 1,
                      color: Theme.of(context).colorScheme.primary),
                  ResultBox(
                    type: "Entry Hole",
                    count: data.entryHole.toString(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
