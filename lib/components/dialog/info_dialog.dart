import 'package:flutter/material.dart';
import 'package:suri/components/container/cycle_info_container.dart';
import 'package:suri/model/data_model.dart';

void showInfoDialog(
  BuildContext context,
  ClassificationModel data,
  String? image,
) {
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
      content: IntrinsicHeight(
        child: Column(children: [
          if (image != null)
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          CycleInfoContainer(
            count: data.ripe.toString(),
            label: "Ripe",
          ),
          CycleInfoContainer(
            count: data.unripe.toString(),
            label: "Unripe",
          ),
          CycleInfoContainer(
            count: data.infectedBerry.toString(),
            label: "Infested Berry",
          ),
          CycleInfoContainer(
            count: data.entryHole.toString(),
            label: "Entry Hole",
          ),
        ]),
      ),
    ),
  );
}
