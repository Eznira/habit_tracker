
import 'package:habit_tracker/data/dto/mapper.dart';
import 'package:habit_tracker/domain/entities/settings_entity.dart';
import 'package:habit_tracker/domain/repository/settings_repo.dart';
import 'package:isar/isar.dart';

import '../models/settings.dart';

class SettingRepoImpl implements SettingsRepo {

  final Isar _isar;
  SettingRepoImpl(this._isar);

  @override
  Future<SettingsEntity> firstLaunch() async{
    Settings? settings = await _isar.settings.where().findFirst();
    return SettingsMapper.toEntity(settings!);
  }

}