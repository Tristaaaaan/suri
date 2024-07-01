import 'package:flutter/material.dart';
import 'package:suri/components/container/cycle_info_container.dart';
import 'package:suri/model/data_model.dart';

void showInfoDialog(BuildContext context, String title, String message,
    ClassificationModel data) {
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
          CycleInfoContainer(
            count: data.ripe.toString(),
          ),
          CycleInfoContainer(
            count: data.unripe.toString(),
          ),
          CycleInfoContainer(
            count: data.infectedBerry.toString(),
          ),
          CycleInfoContainer(
            count: data.entryHole.toString(),
          ),
        ]),
      ),
    ),
  );
}
