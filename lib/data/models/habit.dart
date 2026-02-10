import 'package:isar/isar.dart';

part 'habit.g.dart';

@collection
class Habit {
  // id
  Id id = Isar.autoIncrement;

  // habit name
  late String habitName;

  List<DateTime> completedDays = [];


  bool get isCompletedToday {
    final today = DateTime.now();

    return completedDays.any((day) =>
    day.year == today.year &&
        day.month == today.month &&
        day.day == today.day);
  }

}
