

import 'package:habit_tracker/domain/app_event.dart';
import 'package:habit_tracker/domain/usecases/create_habit_usecase.dart';

import '../app_event_bus.dart';
import '../repository/habit_repo.dart';
import '../repository/heatmap_repo.dart';

class EditHabitUseCase {

  final HabitRepo _habitRepo;
  final HeatmapRepo _heatmapRepo;
  final AppEventBus _eventBus;


  EditHabitUseCase(this._habitRepo, this._heatmapRepo, this._eventBus);

  Future<void> execute (int id, String habitName) async {

    await _habitRepo.editHabit(id, habitName);
    await _heatmapRepo.updateToday();
    _eventBus.emit(EditedHabitEvent(DateTime.now()));
  }

}