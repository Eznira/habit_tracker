import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_tracker/data/database.dart';
import 'package:habit_tracker/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import '../components/custom_dialogue.dart';
import '../components/habit_tile.dart';
import '../models/habit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  // add new habit
  void addNewHabit(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // Habit instance
          final habitDb = context.read<HabitDb>();

          return CustomDialogue(
            controller: controller,

            // handle 'save' ontap
            save: () {
              if (controller.text != '') {
                habitDb.createHabit(controller.text);
                controller.clear();
                Navigator.pop(context);
              }
            },

            // handle 'cancel' onTap
            cancel: () {
              controller.clear();
              Navigator.pop(context);
            },
          );
        });

    // save
  }

  // toggle habit completion state
  void toggleHabit(Habit habit, bool? value) {
    if (value != null) {
      context.read<HabitDb>().updateCompletedDays(habit.id, value);
    }
  }

  // delete habit
  void deleteHabit(BuildContext context, Habit habit) {
    // debug
    print('first call for delete');

    context.read<HabitDb>().deleteHabit(habit.id);
  }

  // delete habit
  void editHabit() {}

  Widget buildHabitList() {
    final habitDb = context.watch<HabitDb>();
    List<Habit> habitList = habitDb.habitList;

    return ListView.builder(
      // shrinkWrap: false,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final habit = habitList[index];
        bool isCompleted = isHabitCompleted(habit);

        return HabitTile(
          habitName: habit.habitName,
          onCompleted: isCompleted,
          onChanged: (value) => toggleHabit(habit, value),
          deleteHabit: (context) => deleteHabit(context, habit),
          editHabit: (context) {},
        );
      },
      itemCount: habitList.length,
    );
  }

  @override
  void initState() {
    Provider.of<HabitDb>(context, listen: false).readHabits();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
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
        onPressed: () => addNewHabit(context),
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeatMap(
              datasets: {
                DateTime(2024, 10, 13): 3,
                DateTime(2024, 10, 15): 2,
                DateTime(2024, 10, 16): 5,
                DateTime(2024, 10, 17): 7,
              },
              startDate: DateTime.now().subtract(const Duration(days: 12)),
              endDate: DateTime.now().add(const Duration(days: 12)),
              colorMode: ColorMode.opacity,
              showText: false,
              scrollable: true,
              textColor: Theme.of(context).colorScheme.inversePrimary,
              defaultColor: Theme.of(context).colorScheme.primary,
              size: 26,
              colorsets: const {
                1: Colors.green,
              },
            ),
            Expanded(
              child: buildHabitList(),
            )
          ],
        ),
      ),
    );
  }
}

// Util
bool isHabitCompleted(Habit habit) {
  final today = DateTime.now();

  return (habit.completedDays.any((e) =>
      e.year == today.year && e.month == today.month && e.day == today.day));
}
