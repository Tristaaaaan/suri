import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suri/functions/chart_functions.dart';
import 'package:suri/model/data_model.dart';

class LineChartPage extends StatelessWidget {
  final List<DataModel> data;
  const LineChartPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: data.length.toDouble(),
        maxY: highestValue(data),
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.white,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              const textStyle = TextStyle(
                fontSize: 10, // Adjust the font size here
                fontWeight: FontWeight.bold, // Optional: Adjust the font weight
              );
              // Define color for each line
              Color getLineColor(int index) {
                switch (index) {
                  case 0:
                    return Colors.red; // Color for the first line (ripe)
                  case 1:
                    return Colors.green; // Color for the second line (unripe)
                  case 2:
                    return Colors.brown; // Color for the third line (infested)
                  default:
                    return Colors.white; // Default color
                }
              }

              return LineTooltipItem(
                '${touchedSpot.y.toInt()}',
                textStyle.copyWith(color: getLineColor(touchedSpot.barIndex)),
              );
            }).toList();
          },
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        ripe,
        unripe,
        infested,
      ];

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );

    // Display the title only if it matches a step
    if (value % 1 == 0) {
      return Text(value.toInt().toString(), // Convert to integer
          style: style,
          textAlign: TextAlign.center);
    } else {
      return Container(); // Hide the label if it doesn't match the step
    }
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: setRightIntervals(data.length),
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // Extract and format timestamps
    List<String> timestamps = data.map((e) => e.timestamp.toString()).toList();

    // Convert timestamps to hour, minute, and second format
    List<String> formattedTimes = timestamps.map((timestamp) {
      DateTime dt = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(timestamp);
      return DateFormat("hh:mm a").format(dt);
    }).toList();

    // Define the text style
    const style = TextStyle(
      fontSize: 8,
    );

    // Convert the double value to an integer index
    int index = value.toInt();
    Widget text;

    if (index >= 0 && index < formattedTimes.length) {
      text = Text(formattedTimes[index], style: style);
    } else {
      text = const Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: setBottomIntervals(data.length),
        getTitlesWidget: bottomTitleWidgets,
      );

  // Grid
  FlGridData get gridData => const FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: true,
      );

  // Border
  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black, width: 2),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get ripe => LineChartBarData(
        isCurved: true,
        preventCurveOverShooting: true,
        color: Colors.red,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: 2,
              color: Colors.white,
              strokeWidth: 1,
              strokeColor: Colors.red,
            );
          },
          checkToShowDot: (spot, barData) {
            return spot.x != 0 && spot.x != 6;
          },
        ),
        belowBarData: BarAreaData(show: false),
        spots: getRipeSpots(data),
      );

  LineChartBarData get unripe => LineChartBarData(
        isCurved: true,
        preventCurveOverShooting: true,
        color: Colors.green,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: 2,
              color: Colors.white,
              strokeWidth: 1,
              strokeColor: Colors.red,
            );
          },
          checkToShowDot: (spot, barData) {
            return spot.x != 0 && spot.x != 6;
          },
        ),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.blue,
        ),
        spots: getUnripeSpots(data),
      );

  LineChartBarData get infested => LineChartBarData(
        isCurved: true,
        preventCurveOverShooting: true,
        color: Colors.brown,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: getInfestedSpots(data),
      );
}
