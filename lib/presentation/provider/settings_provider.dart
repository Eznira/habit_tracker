import 'package:flutter/cupertino.dart';

import '../../domain/entities/settings_entity.dart';
import '../../domain/repository/settings_repo.dart';

class SettingsProvider extends ChangeNotifier {
  final SettingsRepo _settingsRepo;

  SettingsProvider(this._settingsRepo);

  SettingsEntity? _settings;

  SettingsEntity? get settings => _settings;

  Future<void> loadSettings() async {
    _settings = await _settingsRepo.firstLaunch();
    notifyListeners();
  }

}