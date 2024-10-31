import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  // id
  final id = Isar.autoIncrement;

  // first launched date
  late DateTime initLaunchedDay;
}
