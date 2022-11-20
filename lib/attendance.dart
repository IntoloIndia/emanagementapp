import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

Map<DateTime, List<Meeting>>? _dataCollection;

class _AttendanceState extends State<Attendance> {
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  late var _calendarDataSource;

  @override
  void initState() {
    _dataCollection = _getDataSource() as Map<DateTime, List<Meeting>>;
    _calendarDataSource = MeetingDataSource(<Meeting>[]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 4, 26, 54),
                borderRadius: BorderRadius.circular(8)),
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text("Select Date"),
                        content: Container(
                          height: 200,
                          child: Column(
                            children: [
                              const Text('From Date'),
                              TextField(
                                controller: fromDate,
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.calendar_today),
                                    labelText: "Select Date"),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat("dd-MM-yyyy")
                                            .format(pickedDate);
                                    setState(() {
                                      fromDate.text = formattedDate.toString();
                                    });
                                  } else {
                                    const Text('Please select date');
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('To Date'),
                              TextField(
                                controller: toDate,
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.calendar_today),
                                    labelText: "Select Date"),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat("dd-MM-yyyy")
                                            .format(pickedDate);
                                    setState(() {
                                      toDate.text = formattedDate.toString();
                                    });
                                  } else {
                                    const Text('Please select date');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                fromDate.text;
                                toDate.text;
                                Navigator.of(context).pop();
                              },
                              child: const Text('Confirm'))
                        ],
                      );
                    }));
              },
              child: const Text(
                'Apply Leave',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SfCalendar(
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showAgenda: true),
              dataSource: _calendarDataSource,
              todayHighlightColor: Colors.transparent,
              todayTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
              view: CalendarView.month,
              loadMoreWidgetBuilder: (BuildContext context,
                  LoadMoreCallback loadMoreAppointments) {
                return FutureBuilder(
                  future: loadMoreAppointments(),
                  builder: (context, snapshot) {
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  int num = 2;
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, num, 0, 0);
  final DateTime endTime = startTime.add(Duration(hours: 3, minutes: 30));
  meetings.add(Meeting(
      'Presented', startTime, endTime, const Color.fromARGB(255, 0, 117, 55)));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  // @override
  // bool isAllDay(int index) {
  //   return appointments![index].isAllDay;
  // }
}

class Meeting {
  Meeting(
    this.eventName,
    this.from,
    this.to,
    this.background,
    // this.isAllDay
  );

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  // bool isAllDay;
}
