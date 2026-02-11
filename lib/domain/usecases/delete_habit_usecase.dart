import 'package:habit_tracker/domain/app_event_bus.dart';
import 'package:habit_tracker/domain/repository/habit_repo.dart';
import 'package:habit_tracker/domain/repository/heatmap_repo.dart';

import '../app_event.dart';

class DeleteHabitUseCase {

  final HabitRepo _habitRepo;
  final HeatmapRepo _heatmapRepo;
  final  AppEventBus _eventBus;


  DeleteHabitUseCase(this._habitRepo, this._heatmapRepo, this._eventBus);

  Future<void> execute (int id) async {
    await _habitRepo.deleteHabit(id);
    await _heatmapRepo.updateToday();
    _eventBus.emit(DeletedHabitEvent(DateTime.now()));
  }
}