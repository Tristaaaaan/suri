import 'package:fl_chart/fl_chart.dart';
import 'package:suri/model/data_model.dart';

double setBottomIntervals(int length) {
  int dataLength = length;

  if (dataLength <= 1) {
    return 1;
  } else if (dataLength <= 4) {
    return 1;
  } else if (dataLength <= 10) {
    return 2;
  } else if (dataLength <= 20) {
    return 5;
  } else {
    return 10;
  }
}

double setRightIntervals(int length) {
  int dataLength = length;

  if (dataLength <= 1) {
    return 1;
  } else if (dataLength <= 4) {
    return 1;
  } else if (dataLength <= 10) {
    return 2;
  } else if (dataLength <= 20) {
    return 5;
  } else {
    return 10;
  }
}

double highestValue(List<DataModel> data) {
  // Extract the values from the data
  List<int> ripe = data.map((e) => e.classCounts.ripe).toList();
  List<int> unripe = data.map((e) => e.classCounts.unripe).toList();
  List<int> infected = data.map((e) => e.classCounts.infectedBerry).toList();

  // Find the highest values in each list
  int maxRipe = ripe.isNotEmpty ? ripe.reduce((a, b) => a > b ? a : b) : 0;
  int maxUnripe =
      unripe.isNotEmpty ? unripe.reduce((a, b) => a > b ? a : b) : 0;
  int maxInfected =
      infected.isNotEmpty ? infected.reduce((a, b) => a > b ? a : b) : 0;

  // Find the overall highest value
  int highest =
      [maxRipe, maxUnripe, maxInfected].reduce((a, b) => a > b ? a : b);

  return highest.toDouble();
}

List<FlSpot> getInfestedSpots(List<DataModel> data) {
  List<FlSpot> spots = [];

  for (int i = 0; i < data.length; i++) {
    final count = data[i].classCounts.infectedBerry;
    spots.add(FlSpot(i.toDouble(), count.toDouble()));
  }
  return spots;
}

List<FlSpot> getRipeSpots(List<DataModel> data) {
  List<FlSpot> spots = [];

  for (int i = 0; i < data.length; i++) {
    final count = data[i].classCounts.ripe;
    spots.add(FlSpot(i.toDouble(), count.toDouble()));
  }
  return spots;
}

List<FlSpot> getUnripeSpots(List<DataModel> data) {
  List<FlSpot> spots = [];

  for (int i = 0; i < data.length; i++) {
    final count = data[i].classCounts.unripe;
    spots.add(FlSpot(i.toDouble(), count.toDouble()));
  }
  return spots;
}
