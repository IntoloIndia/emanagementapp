import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'constant.dart';

class Cal extends StatefulWidget {
  const Cal({super.key});

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  late var _calendarDataSource;

  List absent = [11, 18, 24, 4];
  List leave = [14, 15, 16];
  List present = [
    1,
    2,
    3,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    13,
    17,
    19,
    20,
    21,
    22,
    23,
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final Widget calendar =
        Theme(data: ThemeData(), child: _getHeatMapCalendar());

    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 212, 212, 212),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Leaves',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: iconColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: iconColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Select Date",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: iconColor,
                                        ),
                                      ),
                                      content: Container(
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Text(
                                              'From Date',
                                              style:
                                                  TextStyle(color: iconColor),
                                            ),
                                            TextField(
                                              // controller: fromDate,
                                              decoration: InputDecoration(
                                                  icon: Icon(
                                                    Icons.calendar_today,
                                                    color: iconColor,
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color: iconColor),
                                                  labelText: "Select Date"),
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(2101));
                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat("dd-MM-yyyy")
                                                          .format(pickedDate);
                                                  setState(() {
                                                    // fromDate.text =
                                                    // formattedDate.toString();
                                                  });
                                                } else {
                                                  const Text(
                                                      'Please select date');
                                                }
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'To Date',
                                              style:
                                                  TextStyle(color: iconColor),
                                            ),
                                            TextField(
                                              // controller: toDate,
                                              decoration: InputDecoration(
                                                  icon: Icon(
                                                    Icons.calendar_today,
                                                    color: iconColor,
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color: iconColor),
                                                  labelText: "Select Date"),
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(2101));
                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat("dd-MM-yyyy")
                                                          .format(pickedDate);
                                                  setState(() {
                                                    // toDate.text =
                                                    //     formattedDate.toString();
                                                  });
                                                } else {
                                                  const Text(
                                                      'Please select date');
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: iconColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextButton(
                                              onPressed: () {
                                                // fromDate.text;
                                                // toDate.text;
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Submit',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        )
                                      ],
                                    );
                                  }));
                            },
                            child: const Text(
                              'Apply',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Leave Status',
                          style: TextStyle(fontSize: 18, color: iconColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('1.'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Date'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: iconColor,
                          child: Icon(
                            Icons.check,
                            color: themeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Container(height: 350, child: calendar),
            ),
          ],
        ),
      ),
    );
  }

  /// Returns the calendar widget based on the properties passed.
  SfCalendar _getHeatMapCalendar() {
    bool isTap = false;
    return SfCalendar(
        headerStyle: CalendarHeaderStyle(
            textAlign: TextAlign.center,
            backgroundColor: iconColor,
            textStyle: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.normal,
                letterSpacing: 5,
                color: Color(0xffff5eaea),
                fontWeight: FontWeight.w500)),
        viewHeaderStyle: const ViewHeaderStyle(
            backgroundColor: Color.fromARGB(255, 214, 214, 214),
            dayTextStyle: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 77, 77, 77),
                fontWeight: FontWeight.w500),
            dateTextStyle: TextStyle(
                fontSize: 20,
                color: Color(0xFFff5eaea),
                letterSpacing: 2,
                fontWeight: FontWeight.w500)),
        showNavigationArrow: true,
        view: CalendarView.month,
        dataSource: _getDataSource(),
        monthCellBuilder: _monthCellBuilder,
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.none,
            showTrailingAndLeadingDates: false,
            showAgenda: true,
            agendaStyle:
                AgendaStyle(appointmentTextStyle: TextStyle(fontSize: 17)),
            agendaItemHeight: 60,
            agendaViewHeight: 75));
  }

  Widget _monthCellBuilder(
      BuildContext buildContext, MonthCellDetails details) {
    final Color backgroundColor =
        _getMonthCellBackgroundColor(details.date, absent, present, leave);
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.black54, width: 0.5)),
      child: Center(
        child: Text(
          details.date.day.toString(),
          // style: TextStyle(color: _getCellTextColor(backgroundColor)),
        ),
      ),
    );
  }

  Color _getMonthCellBackgroundColor(
      DateTime date, List abs, List pres, List lvs) {
    Color col = Color.fromARGB(255, 224, 224, 224);
    for (var i = 0; i < pres.length; i++) {
      for (var j = 0; j < abs.length; j++) {
        for (var k = 0; k < lvs.length; k++) {
          if (date.day == pres[i]) {
            col = kGreen;
          } else if (date.day == abs[j]) {
            col = kRed;
          } else if (date.day == lvs[k]) {
            col = kBlue;
          }
        }
      }
    }
    return col;
  }
}

var isPre = false;
MeetingDataSource _getDataSource() {
  List<Meeting> meetings = <Meeting>[];
  String eventName = isPre != true ? 'Absent' : 'Present';
  DateTime startTime = DateTime.utc(2022, 11, 2, 30, 15);
  DateTime endTime = startTime.add(const Duration(hours: 0, minutes: 0));
  Color background = isPre != true
      ? Colors.redAccent
      : const Color.fromARGB(255, 23, 187, 108);

  meetings.add(Meeting(eventName, startTime, endTime, background));
  return MeetingDataSource(meetings);
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}

class Meeting {
  Meeting(this.eventName, this.startTime, this.endTime, this.background);

  String eventName;
  DateTime startTime;
  DateTime endTime;
  Color background;
}
