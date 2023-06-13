import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_courseapp/utilis/colors.dart';
import 'package:online_courseapp/views/home/home_view.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widget/coursecard.dart';

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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "27 November",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kgreyClr,
                  size: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: CourseCard(
                title: "App UI Prototyping",
                subtitle: "Design",
                authorname: "Daninel Walter",
                avatar:
                    "https://images.unsplash.com/photo-1525357816819-392d2380d821?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80",
                date: "27 November 2023 . 3 Hours",
                coursecard: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
