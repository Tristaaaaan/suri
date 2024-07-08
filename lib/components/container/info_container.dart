import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suri/components/dialog/info_dialog.dart';
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
        showInfoDialog(
          context,
          data.classCounts,
          data.downloadUrl,
        );
      },
      child: IntrinsicHeight(
          child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('EEEE, MMMM d, yyyy')
                              .format(data.timestamp),
                        ),
                        Text(
                          DateFormat('EEEE, MMMM d, yyyy')
                              .format(data.timestamp),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
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

class ResultBox extends StatelessWidget {
  final String count;
  final String type;
  const ResultBox({
    super.key,
    required this.count,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(count),
      const SizedBox(
        height: 5,
      ),
      Text(
        type,
        style: const TextStyle(fontSize: 12),
      ),
    ]);
  }
}
