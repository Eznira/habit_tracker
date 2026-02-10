import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/domain/app_event_bus.dart';
import 'package:habit_tracker/domain/entities/daily_stats_entity.dart';

import '../../domain/app_event.dart';
import '../../domain/repository/heatmap_repo.dart';

class HeatmapProvider extends ChangeNotifier {
  final HeatmapRepo _repo;
  final AppEventBus _appEventBus;

  HeatmapProvider(this._repo, this._appEventBus) {
    _appEventBus.stream.listen((event) {
      loadHeatmap();
    });
  }

  List<DailyStatsEntity> _dailyStat = [];

  List<DailyStatsEntity> get dailyStat => _dailyStat;

  Future<void> loadHeatmap() async {
    _dailyStat = await _repo.getDailyStats();
    notifyListeners();
  }

  /// Called when habit completion changes
  Future<void> updateToday(bool increment) async {
    final value = await _repo.updateToday(increment);
    await loadHeatmap();
  }
}
