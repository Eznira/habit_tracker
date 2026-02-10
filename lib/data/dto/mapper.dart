import 'package:habit_tracker/data/models/daily_stat.dart';
import 'package:habit_tracker/domain/entities/daily_stats_entity.dart';
import 'package:habit_tracker/domain/entities/settings_entity.dart';

import '../../../domain/entities/habit_entity.dart';
import '../models/habit.dart';
import '../models/settings.dart';


class HabitMapper {
  static HabitEntity toEntity(Habit model) {
    return HabitEntity(
      id: model.id,
      name: model.habitName,
      completedDays: model.completedDays,

    );
  }

  static Habit toModel(HabitEntity entity) {
    return Habit()
      ..id = entity.id
      ..habitName = entity.name
      ..completedDays = entity.completedDays;
  }
}


class DailyStatMapper {
  static DailyStatsEntity toEntity(DailyHabitStats model) {
    return DailyStatsEntity(
      date: model.date,
      completedCount: model.completedCount,
      totalHabits: model.totalHabits ,
      intensityLevel: model.intensityLevel,
    );
  }

  static DailyHabitStats toModel(DailyStatsEntity entity) {
    return DailyHabitStats()
      ..date = entity.date
      ..completedCount = entity.completedCount
      ..intensityLevel = entity.intensityLevel
      ..totalHabits = entity.totalHabits;

  }
}



class SettingsMapper {
  static SettingsEntity toEntity(Settings model) {
    return SettingsEntity(
      id: model.id, date: model.initLaunchedDay
    );
  }

  static Settings toModel(SettingsEntity entity) {
    return Settings(
    )..id = entity.id..initLaunchedDay = entity.date;
  }
}