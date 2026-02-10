import '../entities/habit_entity.dart';

abstract class HabitRepo {
  Future<List<HabitEntity>> getHabits();
  Future<void> toggleHabit(int habitId, bool completed);
  Future<void> createHabit(String habitName);
  Future<void> deleteHabit(int id);
}
