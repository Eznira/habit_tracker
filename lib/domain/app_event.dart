abstract class AppEvent {}

class HabitToggledEvent extends AppEvent {
  final DateTime time;

  HabitToggledEvent(this.time);
}

