// domain/entities/daily_stats_entity.dart

class DailyStatsEntity {
  final DateTime date;
  final int completedCount;
  final int totalHabits;
  final int intensityLevel;

  DailyStatsEntity({
    required this.date,
    required this.completedCount,
    required this.totalHabits,
    required this.intensityLevel,
  });


  // @override
  // String toString() {
  //   return 'DailyStatsEntity{date: $date, completedCount: $completedCount, totalHabits: $totalHabits, intensityLevel: $intensityLevel}';
  // }
}
