import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/settings.dart';

/**
 * Isar DB
 */

class HabitDb extends ChangeNotifier {
  static late Isar isar;

  Future<DateTime> getFirstDate() async {
    Settings? settings = await isar.settings.where().findFirst();
    return settings!.initLaunchedDay;
  }

  // Getter for heatMapData
  // Future<HeatMap> get heatMapData async {
  //   final habits = await isar.habits.where().findAll();
  //   final datasets = <DateTime, int>{};
  //
  //   for (final habit in habits) {
  //     for (final completedDay in habit.completedDays) {
  //       datasets[completedDay] = (datasets[completedDay] ?? 0) + 1;
  //     }
  //   }
  //
  //   return HeatMap(
  //     datasets: datasets,
  //     startDate: DateTime.now().subtract(const Duration(days: 365)),
  //     endDate: DateTime.now().add(const Duration(days: 365)),
  //     colorsets: {},
  //   );
  // }

  // create settings for getting first launch date
  static Future<void> _configureAppSettings() async {
    // find local setting
    Settings? settings = await isar.settings.where().findFirst();

    // create if settings dosen't exist
    if (settings == null) {
      Settings settings = Settings()..initLaunchedDay = DateTime.now();
      await isar.writeTxn(() => isar.settings.put(settings));
    }
  }

  // Initialize Db
  static Future<void> initialize() async {
    // Get path to project directory
    final directory = await getApplicationDocumentsDirectory();

    // Create Isar instance
    isar = await Isar.open([HabitSchema, SettingsSchema],
        directory: directory.path);

    // saved firs-time launch date
    _configureAppSettings();
  }

  /**
   * CRUD Operations
   */

  // Local habitLists Object
  final List<Habit> habitList = [];

  // Create
  Future<void> createHabit(String habitName) async {
    // create habit
    final habit = Habit()..habitName = habitName;

    // put habit in habitSchema
    await isar.writeTxn(() async {
      await isar.habits.put(habit);
    });

    //read to local db
    readHabits();
  }

// Read
  Future<void> readHabits() async {
    // fetch habit list
    List<Habit> fetchedHabitList = await isar.habits.where().findAll();

    //update local habit list
    habitList.clear();
    habitList.addAll(fetchedHabitList);

    //notify listeners
    notifyListeners();
  }

  // Update
  // Update habitName
  Future<void> updateHabit(int id, String newName) async {
    // Get habit from db
    Habit? habit = await isar.habits.get(id);

    // Update name
    if (habit != null) {
      habit.habitName = newName;
    }

    // Put update Habit in db
    await isar.writeTxn(() async {
      await isar.habits.put(habit!);
    });

    // re-read
    readHabits();
  }

  // Update habit-completed days
  Future<void> updateCompletedDays(int id, bool onCheck) async {
    // Get Habit by id
    Habit? habit = await isar.habits.get(id);

    if (habit != null) {
      // get today's date
      DateTime today = DateTime.now();

      // add or remove today from completed-days list
      if (onCheck && !habit.completedDays.contains(today)) {
        habit.completedDays.add(DateTime(
          today.year,
          today.month,
          today.day,
        ));
      } else {
        habit.completedDays.removeWhere((date) =>
            date.year == today.year &&
            date.month == today.month &&
            date.day == today.day);
      }

      // Put in db
      await isar.writeTxn(() async {
        await isar.habits.put(habit);
      });

      // re-read to local db
      readHabits();
    }
  }

  // Delete
  Future<void> deleteHabit(int habitId) async {
    // debug
    print('attempted delete');
    // delete from db
    await isar.writeTxn(() async {
      await isar.habits.delete(habitId);
    });

    // re-read
    readHabits();
  }
}

// Util Method for adding and removing current date for habit based on
// completed state of habit

bool onCompleted(Habit habit) {
  final today = DateTime.now();

  return (habit.completedDays.any((e) =>
      e.year == today.year && e.month == today.month && e.day == today.day));
}
