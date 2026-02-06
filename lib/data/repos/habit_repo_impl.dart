import 'package:habit_tracker/data/dto/mapper.dart';
import 'package:habit_tracker/domain/entities/habit_entity.dart';
import 'package:habit_tracker/domain/repository/habit_repo.dart';

import 'package:isar/isar.dart';

import '../models/habit.dart';

class HabitRepoImpl implements HabitRepo {
  final Isar isar;
  HabitRepoImpl(this.isar);

  @override
  Future<List<HabitEntity>> getHabits() async {
    final habits = await isar.habits.where().findAll();
    return habits.map((h) => HabitMapper.toEntity(h)).toList();
  }

  @override
  Future<void> toggleHabit(int habitId, bool completed) async {
    final habit = await isar.habits.get(habitId);

    if (habit != null) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      if (completed && !habit.completedDays.contains(today)) {
        habit.completedDays.add(today);
      } else {
        habit.completedDays.remove(today);
      }
    }

    await isar.writeTxn(() async {
      await isar.habits.put(habit!);
    });

  }

  @override
  Future<void> deleteHabit(int id) async {
    await isar.writeTxn(() => isar.habits.delete(id));
  }

}