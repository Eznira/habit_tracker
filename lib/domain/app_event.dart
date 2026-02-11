abstract class AppEvent {}

class HabitToggledEvent extends AppEvent {
  final DateTime time;
  HabitToggledEvent(this.time);
}

class HabitCreatedEvent extends AppEvent {
  final DateTime time;
  HabitCreatedEvent(this.time);
}

class EditedHabitEvent extends AppEvent {
  final DateTime time;
  EditedHabitEvent(this.time);
}


class DeletedHabitEvent extends AppEvent {
  final DateTime time;
  DeletedHabitEvent(this.time);
}
