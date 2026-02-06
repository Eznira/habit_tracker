import 'package:flutter/material.dart';
import 'package:habit_tracker/data/datasource/local/isar_db.dart';
import 'package:habit_tracker/data/repos/setting_repo_impl.dart';
import 'package:habit_tracker/domain/repository/settings_repo.dart';
import 'package:habit_tracker/presentation/pages/home.dart';
import 'package:habit_tracker/presentation/provider/habit_provider.dart';
import 'package:habit_tracker/presentation/provider/heatmap_provider.dart';
import 'package:habit_tracker/presentation/provider/settings_provider.dart';
import 'package:habit_tracker/themes/theme_provider.dart';
import 'package:habit_tracker/themes/themes.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'data/repos/habit_repo_impl.dart';
import 'data/repos/heatmap_repo_impl.dart';
import 'domain/app_event_bus.dart';
import 'domain/usecases/toggle_habit_usecase.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await HabitDb.initialize();

  await IsarDb.initialize();
  final isar = IsarDb.isar;

  // Create repositories
  final habitRepo = HabitRepoImpl(isar);
  final heatRepo = HeatmapRepoImpl(isar);
  final settingsRepo = SettingRepoImpl(isar);

  //Create event bus
  final eventBus = AppEventBus();

  // Create use cases
  final toggleHabitUseCase = ToggleHabitUseCase(habitRepo, heatRepo, eventBus);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HabitProvider(
              habitRepo,
              toggleHabitUseCase, eventBus)..loadHabits(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HeatmapProvider(heatRepo, eventBus)..loadHeatmap(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SettingsProvider(settingsRepo)..loadSettings(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const Home(),
    );
  }
}
