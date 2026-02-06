import 'package:isar/isar.dart';

part 'habit.g.dart';

@collection
class Habit {
  // id
  Id id = Isar.autoIncrement;

  // habit name
  late String habitName;

  List<DateTime> completedDays = [];
  // DateTime(),
  // DateTime(),
  // DateTime(),
}
