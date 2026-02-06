import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/domain/entities/daily_stats_entity.dart';
import 'package:habit_tracker/domain/entities/habit_entity.dart';
import 'package:habit_tracker/presentation/provider/habit_provider.dart';
import 'package:habit_tracker/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../data/models/habit.dart';
import '../provider/heatmap_provider.dart';
import '../provider/settings_provider.dart';

import '../widgets/custom_heat_map.dart';
import '../widgets/habit_tile.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();

  // add new habit
  void addAndEditNewHabit([Habit? habit]) {
    // String? oldName;

    // for editing existing habit name
    // if (habit != null) {
    //   oldName = habit.habitName;
    //   controller.text = oldName;
    // }
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       // Habit instance
    //       final habitDb = context.read<HabitDb>();
    //
    //       // custom dialogue
    //       return CustomDialogue(
    //         controller: controller,
    //
    //         // handle 'save' ontap
    //         save: () {
    //           if (controller.text != '' && habit == null) {
    //             habitDb.createHabit(controller.text);
    //             controller.clear();
    //             Navigator.pop(context);
    //           } else {
    //             habitDb.updateHabit(habit!.id, controller.text);
    //             controller.clear();
    //             Navigator.pop(context);
    //           }
    //         },
    //
    //         // handle 'cancel' onTap
    //         cancel: () {
    //           controller.clear();
    //           Navigator.pop(context);
    //         },
    //       );
    //     });

    // save
  }

  // toggle habit completion state
  void toggleHabit(HabitEntity habit, bool? value) {
    if (value != null) {
      context.read<HabitProvider>().toggleHabit(habit.id, value);
    }
  }

  // delete habit
  void deleteHabit(HabitEntity habit) {
    // context.read<HabitDb>().deleteHabit(habit.id);
  }

  // delete habit
  void editHabit(HabitEntity habit) {
    // // call show dialogue box and prefill with habit name
    // addAndEditNewHabit(habit);
  }


  // build habit list
  Widget buildHabitList() {

    List<HabitEntity> habitList = context.watch<HabitProvider>().habits;


    return ListView.builder(
      // shrinkWrap: false,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final habit = habitList[index];
        bool isCompleted = isHabitCompleted(habit);

        return HabitTile(
          habitName: habit.name,
          onCompleted: isCompleted,
          onChanged: (value) => toggleHabit(habit, value),
          deleteHabit: (context) => deleteHabit(habit),
          editHabit: (context) => editHabit(habit),
        );
      },
      itemCount: habitList.length,
    );
  }

  Widget buildHeatMapWidget() {



    List<DailyStatsEntity> dailyStat = context.watch<HeatmapProvider>().dailyStat;
    DateTime? firstLaunch = context.watch<SettingsProvider>().settings?.date;


    Map<DateTime, int> heatMap = buildHeatMap(dailyStat);

    //debug
    print("heatMap: $heatMap");

    if (firstLaunch == null) {
      return const CircularProgressIndicator();
    }


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomHeatMap(
        startDate: firstLaunch, dataSet: heatMap,
      ),
    );

  }


  @override
  initState()  {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HabitProvider>().loadHabits();
      context.read<SettingsProvider>().loadSettings();
      context.read<HeatmapProvider>().loadHeatmap();
    });

  }


  // habit het-map screen
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        drawer: Drawer(
          backgroundColor: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CupertinoSwitch(
                  value: !Provider.of<ThemeProvider>(context).isLightMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),
                  activeColor: Colors.green,
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => addAndEditNewHabit(),
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: buildHeatMapWidget(),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: buildHabitList(),
              )
            ],
          ),
        ),
      );
    });
  }
}

// Util
bool isHabitCompleted(HabitEntity habit) {
  final today = DateTime.now();

  return (habit.completedDays.any((e) =>
      e.year == today.year && e.month == today.month && e.day == today.day));
}

Map<DateTime, int> buildHeatMap(List<DailyStatsEntity> statEntities) {

  Map<DateTime, int>  heatMap = {};

  for (final stat in statEntities) {
    heatMap[stat.date] = stat.intensityLevel;
  }
  return heatMap;
}
