import 'package:flutter/material.dart';
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
        showInfoDialog(context, "Title", "message", data.classCounts);

        print("data: ${data.toMap()}");
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
                    Text(data.timestamp.toString()),
                    const Text("Monday, September 25, 2023"),
                  ],
                )
              ],
            ),
            const Text("10:30 AM"),
          ],
        ),
      )),
    );
  }
}
