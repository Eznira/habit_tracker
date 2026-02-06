import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/daily_stat.dart';
import '../../models/habit.dart';
import '../../models/settings.dart';

class IsarDb {
  static late Isar isar;

  static Future<void> _configureAppSettings() async {
    // find util setting
    Settings? settings = await isar.settings.where().findFirst();

    // create if settings if doesn't exist
    if (settings == null) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      Settings settings = Settings()..initLaunchedDay = today;
      await isar.writeTxn(() => isar.settings.put(settings));
    }
  }
  static Future<void> _initializeDailyStat() async {
    // find util setting
    DailyHabitStats? dailyHabitStats = await isar.dailyHabitStats.where().findFirst();

    // create if settings doesn't exist
    if (dailyHabitStats == null) {

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      DailyHabitStats dailyHabitStats = DailyHabitStats()
        ..date = today
        ..completedCount = 0
        ..totalHabits = 0
        ..intensityLevel = 0;


      await isar.writeTxn(() => isar.dailyHabitStats.put(dailyHabitStats));
    }
  }

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HabitSchema, DailyHabitStatsSchema, SettingsSchema],
      directory: dir.path,
    );

    await _configureAppSettings();
    await _initializeDailyStat();

  }


}
