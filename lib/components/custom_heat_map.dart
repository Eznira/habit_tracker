import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class CustomHeatMap extends StatelessWidget {
  const CustomHeatMap(
      {super.key, required this.startDate, required this.dataSet});

  final Map<DateTime, int>? dataSet;
  final DateTime? startDate;

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      // datasets: getDataSet(habitDb.habitList),
      datasets: dataSet,
      startDate: startDate,
      // startDate: habitDb.initialLaunchDate,
      endDate: DateTime.now(),
      colorMode: ColorMode.color,
      showText: false,
      scrollable: true,
      showColorTip: false,
      textColor: Theme.of(context).colorScheme.inversePrimary,
      defaultColor: Theme.of(context).colorScheme.primary,
      size: 26,
      colorsets: {
        1: Colors.green.shade200,
        2: Colors.green.shade300,
        3: Colors.green.shade400,
        4: Colors.green.shade500,
        4: Colors.green.shade600,
      },
    );
  }
}
