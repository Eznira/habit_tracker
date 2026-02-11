import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/app_event_bus.dart';
import 'package:habit_tracker/domain/usecases/edit_habit_usecase.dart';
import '../../domain/app_event.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/repository/habit_repo.dart';
import '../../domain/usecases/create_habit_usecase.dart';
import '../../domain/usecases/delete_habit_usecase.dart';
import '../../domain/usecases/toggle_habit_usecase.dart';

class HabitProvider extends ChangeNotifier {
  final HabitRepo _habitRepo;
  final ToggleHabitUseCase _toggleHabitUseCase;
  final CreateHabitUseCase _createHabitUseCase;
  final AppEventBus _appEventBus;
  final EditHabitUseCase _editHabitUseCase;
  final DeleteHabitUseCase _deleteHabitUseCase;


  List<HabitEntity> habits = [];

  HabitProvider(
      this._habitRepo,
      this._toggleHabitUseCase,
      this._appEventBus,
      this._createHabitUseCase,
      this._editHabitUseCase,
      this._deleteHabitUseCase
      ) {
      _appEventBus.stream.listen((event) {
        loadHabits();
  });
  }

  Future<void> loadHabits() async {
    habits = await _habitRepo.getHabits();
    notifyListeners();
  }

  Future<void> toggleHabit(int id, bool done) async {
    await _toggleHabitUseCase.execute(id, done);
  }

  Future<void> createHabit(String habitName) async {
    await _createHabitUseCase.execute(habitName);
  }

  Future<void> editHabit(int id, String habitName) async {
    await _editHabitUseCase.execute(id, habitName);
  }


  Future<void> deleteHabit(int id) async {
    await _deleteHabitUseCase.execute(id);
  }

}
