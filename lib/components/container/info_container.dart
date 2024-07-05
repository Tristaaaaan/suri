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
            Row(
              children: [
                const Icon(Icons.check),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEEE, MMMM d, yyyy').format(data.timestamp),
                    ),
                    Text(
                      DateFormat('EEEE, MMMM d, yyyy').format(data.timestamp),
                    ),
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
