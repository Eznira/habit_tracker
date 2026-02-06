import '../app_event.dart';
import '../app_event_bus.dart';
import '../repository/habit_repo.dart';
import '../repository/heatmap_repo.dart';

class ToggleHabitUseCase {
  final HabitRepo habitRepo;
  final HeatmapRepo heatMapRepo;
  final AppEventBus eventBus;


  ToggleHabitUseCase(this.habitRepo, this.heatMapRepo, this.eventBus);

  Future<void> execute(int habitId, bool completed) async {
    await habitRepo.toggleHabit(habitId, completed);
    await heatMapRepo.updateToday(increment: completed);

    eventBus.emit(HabitToggledEvent(DateTime.now()));
  }
}



