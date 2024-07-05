import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suri/components/container/info_container.dart';
import 'package:suri/components/loading/data_loading.dart';
import 'package:suri/model/data_model.dart';
import 'package:suri/provider/data/detection_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detectionInfo = ref.watch(detectionInfoProvider);
    return Center(
      child: Scaffold(
        body: detectionInfo.when(
          data: (data) {
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
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today's Detection Summary",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "90",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 50),
                                    ),
                                    Text(
                                      "Ripe",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "90",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 50),
                                    ),
                                    Text(
                                      "Ripe",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "90",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 50),
                                    ),
                                    Text(
                                      "Ripe",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "90",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 50),
                                    ),
                                    Text(
                                      "Ripe",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        fontSize: 12,
                                      ),
                                    ),
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
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final DataModel detection = data[index];
                        return InformationContainer(
                          data: detection,
                        );
                      }),
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[300]!,
              child: const DataLoading(),
            );
          },
        ),
      ),
    );
  }
}
