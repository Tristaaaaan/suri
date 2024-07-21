import 'package:flutter/material.dart';

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
      Text(
        count,
        style: count != "0" && (type == "Infested" || type == "Entry Hole")
            ? const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )
            : const TextStyle(fontSize: 12),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        type,
        style: count != "0" && (type == "Infested" || type == "Entry Hole")
            ? const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )
            : const TextStyle(fontSize: 12),
      ),
    ]);
  }
}
