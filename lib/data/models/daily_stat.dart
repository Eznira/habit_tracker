import 'package:isar/isar.dart';

part 'daily_stat.g.dart';

@collection
class DailyHabitStats {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late DateTime date; // normalized midnight

  int completedCount = 0;
  int totalHabits = 0;
  int intensityLevel = 0; // 0–4
}
