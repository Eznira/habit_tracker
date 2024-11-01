// get the list of habits
// create a dataset(type: Map<DateTime, int>) object for storing data
// loop through the habit.completed(type: List<DateTime>)
// for each completed[index](type: DateTime) check if current DateTime
// is in dataset, if (true) => increment the entry(type: int) else =>
// add to dataset with entry of 1.

import '../../models/habit.dart';

Map<DateTime, int>? getDataSet(List<Habit> habitList) {
  Map<DateTime, int> dataSet = {};
  final today = DateTime.now();

  for (var habit in habitList) {
    for (var date in habit.completedDays) {
      if (dataSet.containsKey(date)) {
        dataSet[date] = dataSet[date]! + 1;
      } else {
        dataSet[date] = 1;
      }
    }
  }

  return dataSet;
}
