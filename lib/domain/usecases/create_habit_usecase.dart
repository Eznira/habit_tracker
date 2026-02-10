import 'package:habit_tracker/domain/app_event_bus.dart';
import 'package:habit_tracker/domain/repository/habit_repo.dart';
import 'package:habit_tracker/domain/repository/heatmap_repo.dart';

import '../app_event.dart';

class CreateHabitUseCase {

  final HabitRepo _habitRepo;
  final HeatmapRepo _heatmapRepo;
  final  AppEventBus _eventBus;


  CreateHabitUseCase(this._habitRepo, this._heatmapRepo, this._eventBus);

  Future<void> execute (String habitName) async {
    await _habitRepo.createHabit(habitName);
    await _heatmapRepo.updateToday();
    _eventBus.emit(HabitCreatedEvent(DateTime.now()));
  }
}