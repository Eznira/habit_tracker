// Habit Entity


class HabitEntity {
  final int id;
  final String name;
  final List<DateTime> completedDays;

  HabitEntity({
    required this.id,
    required this.name,
    required this.completedDays,
  });
}
