import 'package:flutter/material.dart';
import 'package:suri/components/container/info_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Column(
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
                          color: Theme.of(context).colorScheme.background,
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
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 50),
                            ),
                            Text(
                              "Ripe",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "90",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 50),
                            ),
                            Text(
                              "Ripe",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "90",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 50),
                            ),
                            Text(
                              "Ripe",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "90",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: 50),
                            ),
                            Text(
                              "Ripe",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
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
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const InformationContainer();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
