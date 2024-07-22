import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suri/components/container/result_box.dart';
import 'package:suri/components/dialog/info_dialog.dart';
import 'package:suri/components/snackbar/information_snackbar.dart';
import 'package:suri/model/data_model.dart';

class InformationContainer extends StatelessWidget {
  final DataModel data;
  const InformationContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final ClassificationModel classification = data.classCounts;
    return GestureDetector(
      onTap: () {
        if (data.downloadUrl != null) {
          showInfoDialog(
            context,
            data.classCounts,
            DateFormat('hh:mm:ss a').format(data.timestamp),
            data.downloadUrl,
          );
        } else {
          informationSnackBar(
              context, Icons.info, "This data does not have an image to show");
        }
      },
      child: IntrinsicHeight(
          child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ResultBox(
                      type: "Ripe",
                      count: classification.ripe.toString(),
                    ),
                    VerticalDivider(
                        thickness: 4,
                        color: Theme.of(context).colorScheme.primary),
                    ResultBox(
                      type: "Unripe",
                      count: classification.unripe.toString(),
                    ),
                    VerticalDivider(
                        thickness: 4,
                        color: Theme.of(context).colorScheme.primary),
                    ResultBox(
                      type: "Infested",
                      count: classification.infectedBerry.toString(),
                    ),
                    VerticalDivider(
                        thickness: 4,
                        color: Theme.of(context).colorScheme.primary),
                    ResultBox(
                      type: "Entry Hole",
                      count: classification.entryHole.toString(),
                    ),
                    VerticalDivider(
                        thickness: 4,
                        color: Theme.of(context).colorScheme.primary),
                  ],
                )
              ],
            ),
            Text(
              DateFormat('hh:mm:ss a').format(data.timestamp),
            ),
          ],
        ),
      )),
    );
  }
}
