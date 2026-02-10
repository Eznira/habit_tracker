import 'package:habit_tracker/data/dto/mapper.dart';
import 'package:habit_tracker/domain/entities/daily_stats_entity.dart';
import 'package:isar/isar.dart';

import '../../domain/repository/heatmap_repo.dart';
import '../models/daily_stat.dart';
import '../models/habit.dart';

class HeatmapRepoImpl implements HeatmapRepo {
  final Isar isar;
  HeatmapRepoImpl(this.isar);


  DateTime _normalize(DateTime d) => DateTime(d.year, d.month, d.day);

  int _heatLevel(double ratio) {
    if (ratio == 0) return 0;
    if (ratio < 0.25) return 1;
    if (ratio < 0.5) return 2;
    if (ratio < 0.75) return 3;
    return 4;
  }


  @override
  Future<void> updateToday([bool? increment]) async {

    final date = DateTime.now();
    final today = _normalize(date);

    await isar.writeTxn(() async {
      DailyHabitStats? stats = await isar.dailyHabitStats.where().dateEqualTo(today).findFirst();

      //get total habits
      int totalHabits = await isar.habits.count();

      //get completed habits
      int completedHabits = await isar.habits.where().
                                  findAll().then(
                                  (habits) => habits.where((habit) => habit.isCompletedToday).
                                  length);



      stats ??= DailyHabitStats()
        ..date = today
        ..totalHabits = totalHabits;


      stats.totalHabits = totalHabits;
      stats.completedCount = completedHabits;
      stats.intensityLevel =
          _heatLevel(stats.completedCount / stats.totalHabits);

      await isar.dailyHabitStats.put(stats);
    });
  }


  @override
  Future<List<DailyStatsEntity>> getDailyStats() async {
    final stats = await isar.dailyHabitStats.where().findAll();
    final statEntities = stats.map((e) => DailyStatMapper.toEntity(e)).toList();
    return statEntities;
  }

}
