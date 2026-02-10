abstract class AppEvent {}

class HabitToggledEvent extends AppEvent {
  final DateTime time;
  HabitToggledEvent(this.time);
}

class HabitCreatedEvent extends AppEvent {
  final DateTime time;
  HabitCreatedEvent(this.time);
}

