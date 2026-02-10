// Habit Entity


class HabitEntity {
  final int id;
  final String name;
  final List<DateTime> completedDays;
  bool get isCompletedToday {
    final today = DateTime.now();

    return completedDays.any((day) =>
    day.year == today.year &&
        day.month == today.month &&
        day.day == today.day);
  }


  HabitEntity({
    required this.id,
    required this.name,
    required this.completedDays,
  });
}
