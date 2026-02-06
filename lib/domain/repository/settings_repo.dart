import 'package:habit_tracker/domain/entities/settings_entity.dart';

abstract class SettingsRepo {
  Future<SettingsEntity> firstLaunch();
}