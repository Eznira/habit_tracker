// Util Method for adding and removing current date for habit based on
// completed state of habit

import 'models/habit.dart';

bool isHabitCompleted(Habit habit) {
  final today = DateTime.now();

  return (habit.completedDays.any((e) =>
      e.year == today.year && e.month == today.month && e.day == today.day));
}
