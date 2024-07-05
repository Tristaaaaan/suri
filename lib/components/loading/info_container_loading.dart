import 'package:flutter/material.dart';
import 'package:suri/components/loading/skeleton.dart';

class InformationLoading extends StatelessWidget {
  const InformationLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
                  Skeleton(height: 17, width: 75),
                  SizedBox(
                    height: 5,
                  ),
                  Skeleton(height: 17, width: 150),
                ],
              )
            ],
          ),
          Skeleton(height: 17, width: 50),
        ],
      ),
    ));
  }
}
