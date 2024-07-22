import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suri/components/container/info_container.dart';
import 'package:suri/components/loading/data_loading.dart';
import 'package:suri/pages/home/charts_data.dart';
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
            return data.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            height: 200,
                            width: 200,
                            "assets/icons/no-notifications--social-media-no-notifications.svg",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Whoops!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            textAlign: TextAlign.center,
                            "Looks like there is no data available yet today.",
                            style: TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            IntrinsicHeight(
                              child: Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1.24,
                                      child: Stack(
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start, // Align items at the start
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start, // Align items to the start horizontally
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    DateFormat(
                                                            'EEEE, MMMM d, yyyy')
                                                        .format(DateTime.now()),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Detection Summary',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 20),
                                                  child: LineChartPage(
                                                    data: data,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Text(
                                    //   "Today's Detection Summary",
                                    //   style: TextStyle(
                                    //       color: Theme.of(context)
                                    //           .colorScheme
                                    //           .background,
                                    //       fontSize: 20),
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Column(
                                    //       children: [
                                    //         Text(
                                    //           "90",
                                    //           style: TextStyle(
                                    //               color: Theme.of(context)
                                    //                   .colorScheme
                                    //                   .background,
                                    //               fontSize: 50),
                                    //         ),
                                    //         Text(
                                    //           "Ripe",
                                    //           style: TextStyle(
                                    //               color: Theme.of(context)
                                    //                   .colorScheme
                                    //                   .background,
                                    //               fontSize: 12),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     Column(
                                    //       children: [
                                    //         Text(
                                    //           "90",
                                    //           style: TextStyle(
                                    //               color: Theme.of(context)
                                    //                   .colorScheme
                                    //                   .background,
                                    //               fontSize: 50),
                                    //         ),
                                    //         Text(
                                    //           "Ripe",
                                    //           style: TextStyle(
                                    //               color: Theme.of(context)
                                    //                   .colorScheme
                                    //                   .background,
                                    //               fontSize: 12),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     Column(
                                    //       children: [
                                    //         Text(
                                    //           "90",
                                    //           style: TextStyle(
                                    //               color: Theme.of(context)
                                    //                   .colorScheme
                                    //                   .background,
                                    //               fontSize: 50),
                                    //         ),
                                    //         Text(
                                    //           "Ripe",
                                    //           style: TextStyle(
                                    //               color: Theme.of(context)
                                    //                   .colorScheme
                                    //                   .background,
                                    //               fontSize: 12),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     Column(
                                    //       children: [
                                    //         Text(
                                    //           "90",
                                    //           style: TextStyle(
                                    //               color: Theme.of(context)
                                    //                   .colorScheme
                                    //                   .background,
                                    //               fontSize: 50),
                                    //         ),
                                    //         Text(
                                    //           "Ripe",
                                    //           style: TextStyle(
                                    //             color: Theme.of(context)
                                    //                 .colorScheme
                                    //                 .background,
                                    //             fontSize: 12,
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: data.map<Widget>((detection) {
                            return InformationContainer(
                              data: detection,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
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
