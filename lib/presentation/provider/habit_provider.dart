import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/app_event_bus.dart';
import '../../domain/app_event.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/repository/habit_repo.dart';
import '../../domain/usecases/toggle_habit_usecase.dart';

class HabitProvider extends ChangeNotifier {
  final HabitRepo _habitRepo;
  final ToggleHabitUseCase _toggleHabitUseCase;
  final AppEventBus _appEventBus;

  List<HabitEntity> habits = [];

  HabitProvider(
      this._habitRepo,
      this._toggleHabitUseCase,
      this._appEventBus
      ) {
    _appEventBus.stream.listen((event) {
      if (event is HabitToggledEvent) {
        loadHabits();
      }
    });
  }

  Future<void> loadHabits() async {
    habits = await _habitRepo.getHabits();
    notifyListeners();
  }

  Future<void> toggleHabit(int id, bool done) async {
    await _toggleHabitUseCase.execute(id, done);
  }

  // Future<void> deleteHabit(int id) async {
  //   await habitRepo.deleteHabit(id);
  //   await loadHabits();
  // }

}
