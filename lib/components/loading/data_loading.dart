import 'package:flutter/material.dart';
import 'package:suri/components/loading/info_container_loading.dart';
import 'package:suri/components/loading/skeleton.dart';

class DataLoading extends StatelessWidget {
  const DataLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            IntrinsicHeight(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton(height: 20, width: 200),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Skeleton(height: 45, width: 60),
                            SizedBox(height: 15),
                            Skeleton(height: 15, width: 60),
                          ],
                        ),
                        Column(
                          children: [
                            Skeleton(height: 45, width: 60),
                            SizedBox(height: 15),
                            Skeleton(height: 15, width: 60),
                          ],
                        ),
                        Column(
                          children: [
                            Skeleton(height: 45, width: 60),
                            SizedBox(height: 15),
                            Skeleton(height: 15, width: 60),
                          ],
                        ),
                        Column(
                          children: [
                            Skeleton(height: 45, width: 60),
                            SizedBox(height: 15),
                            Skeleton(height: 15, width: 60),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const InformationLoading();
            },
          ),
        ),
      ],
    );
  }
}
