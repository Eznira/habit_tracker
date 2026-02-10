// HeatMap Repo

import 'package:habit_tracker/domain/entities/daily_stats_entity.dart';

abstract class HeatmapRepo {
  Future<List<DailyStatsEntity>> getDailyStats();
  Future<void> updateToday([bool increment]);
}
