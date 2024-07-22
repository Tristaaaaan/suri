import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DataPlaceHolder extends StatelessWidget {
  final String imagePath;
  final double imageHeight;
  final double imageWidth;
  final String title;
  final String description;
  const DataPlaceHolder({
    super.key,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              height: imageHeight,
              width: imageWidth,
              imagePath,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
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
            Text(
              textAlign: TextAlign.center,
              description,
              style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
