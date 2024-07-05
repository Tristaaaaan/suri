import 'package:flutter/material.dart';
import 'package:suri/components/loading/info_container_loading.dart';

class DataLoading extends StatelessWidget {
  const DataLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const InformationLoading();
      },
    );
  }
}
