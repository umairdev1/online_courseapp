import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_courseapp/utilis/colors.dart';
import 'package:online_courseapp/views/home/home_view.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kgreyClr,
              size: 20,
            )),
        backgroundColor: kwhiteClr,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Schdule",
          style: TextStyle(
            color: kblackClr,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kblueClr,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime(
                  DateTime.now().year,
                ),
                lastDay: DateTime(2025),
                calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: kprimaryClr, shape: BoxShape.circle),
                    selectedDecoration: BoxDecoration(
                        color: kbottonblueClr, shape: BoxShape.circle)),
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                selectedDayPredicate: (Day) {
                  return isSameDay(_selectedDay, Day);
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                daysOfWeekVisible: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
