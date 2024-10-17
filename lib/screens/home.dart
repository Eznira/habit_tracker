import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_tracker/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import '../components/habit_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void addNewHabit() {
    //Todo: implement adding new habits to db and rebuild UI.
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
        onPressed: addNewHabit,
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
                DateTime(2024, 10, 20): 3,
              },
              startDate: DateTime.now(),
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
              child: ListView(
                children: [
                  HabitTile(
                    habitName: 'Read',
                    onCompleted: true,
                    onChanged: (value) {},
                    deleteHabit: (context) {},
                    editHabit: (context) {},
                  ),
                  HabitTile(
                    habitName: 'Read',
                    onCompleted: false,
                    onChanged: (value) {},
                    deleteHabit: (context) {},
                    editHabit: (context) {},
                  ),
                  HabitTile(
                    habitName: 'Read',
                    onCompleted: false,
                    onChanged: (value) {},
                    deleteHabit: (context) {},
                    editHabit: (context) {},
                  ),
                  HabitTile(
                    habitName: 'Read',
                    onCompleted: true,
                    onChanged: (value) {},
                    deleteHabit: (context) {},
                    editHabit: (context) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
