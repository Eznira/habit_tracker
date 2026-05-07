import 'package:habit_tracker/data/dto/mapper.dart';
import 'package:habit_tracker/domain/entities/settings_entity.dart';
import 'package:habit_tracker/domain/repository/settings_repo.dart';
import 'package:isar/isar.dart';

import '../models/settings.dart';

class SettingRepoImpl implements SettingsRepo {
  final Isar _isar;
  SettingRepoImpl(this._isar);

  Future<void> _createSettings() async {
    final settings = Settings()..initLaunchedDay = DateTime.now();
    await _isar.writeTxn(() async {
      await _isar.settings.put(settings);
    });
  }

  @override
  Future<SettingsEntity> firstLaunch() async {
    Settings? settings = await _isar.settings.where().findFirst();

    if (settings == null) {
      await _createSettings();
      settings = await _isar.settings.where().findFirst();
    }

    return SettingsMapper.toEntity(settings!);
  }
}
