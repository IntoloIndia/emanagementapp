// import 'dart:html';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../constant.dart';
import '../controller/controller.dart';
import '../login.dart';

class Leaves extends StatefulWidget {
  const Leaves({super.key});

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  List<String> items1 = [];
  List<String> items2 = [];
  var cont;

  @override
  void initState() {
    // print(Provider.of<Controller>(context, listen: true).getUserData());
    cont = Provider.of<Controller>(context, listen: false).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cont = Provider.of<Controller>(context, listen: true).userData.userCount;
    final userCount = Provider.of<Controller>(context, listen: true);
    // final Widget calendar =
    //     Theme(data: ThemeData(), child: _getHeatMapCalendar());
    print("ab");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            margin: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Divider(
                  //   thickness: 2,
                  // ),
                  const Text(
                    "Team Status",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: width * 0.14,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1)),
                        child: const Text(
                          '100',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Absent ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: width * 0.14,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1)),
                        child: const Text(
                          '8',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "present ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: width * 0.14,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1)),
                        child: const Text(
                          '92',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.black12, //<-- SEE HERE
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            margin: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Divider(
                  //   thickness: 2,
                  // ),
                  const Text(
                    "Leave Applications",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tanuj Rai",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final List<String> otherIt = [
                            "1/10/2022",
                            "2/10/2022",
                            "3/10/2022",
                            "4/10/2022",
                            "5/10/2022",
                          ];
                          final List<String> ab = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return MultiSelect(items: otherIt);
                            },
                          );

                          setState(() {
                            items1 = ab;
                            print("guestDFac");
                            print(ab);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                            // border: Border.all(color: Colors.black54)
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            "Leave",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Aditya dubey",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final List<String> otherIt = [
                            "1/10/2022",
                            "2/10/2022",
                            "3/10/2022",
                            "4/10/2022",
                            "5/10/2022",
                          ];
                          final List<String> ab = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return MultiSelect(items: otherIt);
                            },
                          );
                          setState(() {
                            items1 = ab;
                            print("guestDFac");
                            print(ab);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                            // border: Border.all(color: Colors.black54)
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            "Leave",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            margin: const EdgeInsets.all(10),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text(
                    "Login Report",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  // Text(${ite}),
                  Container(
                    child: Column(
                      children: [
                        if (userCount.userData.data == null) ...[
                          const Center(child: CircularProgressIndicator())
                        ] else ...[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2)),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "Name",
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2)),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "Status",
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2)),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "Score",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          for (int i = 0;
                              i < userCount.userData.data!.length;
                              i++)
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "${i + 1}  ${userCount.userData.data![i].name}",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Cal(
                                            name: userCount
                                                .userData.data![i].name
                                                .toString(),
                                          ),
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        padding: const EdgeInsets.all(8),
                                        child: const Text(
                                          "p",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  // alignment: Alignment.centerRight,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      width: width * 0.14,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(width: 1)),
                                      child: const Text(
                                        '100',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.remove('login_id');
                  preferences.remove('admin_login_id');

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

var isPre = false;
MeetingDataSource _getDataSource() {
  // for (var j = 0; j < present.length; j++){

  List<Meeting> meetings = <Meeting>[];
  String eventName = isPre != true ? 'Absent' : 'Present';
  DateTime startTime = DateTime.utc(2022, 11);
  DateTime endTime = startTime.add(const Duration(hours: 0, minutes: 0));
  Color background = isPre != true
      ? Colors.redAccent
      : const Color.fromARGB(255, 23, 187, 108);

  meetings.add(Meeting(eventName, startTime, endTime, background));
  // }
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

class MultiSelect extends StatefulWidget {
  List<String> items;

  MultiSelect({required this.items});
  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> selectedItems = [];
  late List<String> items;

  void itemChanges(bool isSelected, String itemValue) {
    setState(
      () {
        if (isSelected) {
          selectedItems.add(itemValue);
        } else {
          selectedItems.remove(itemValue);
        }
      },
    );
  }

  void cancel() {
    Navigator.pop(context);
  }

  void submit() {
    Navigator.pop(context, selectedItems);
  }

  void clear() {
    setState(() {
      selectedItems = [];
      Navigator.pop(context, selectedItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Leave Days"),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map(
                (item) => CheckboxListTile(
                  activeColor: iconColor,
                  value: selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => itemChanges(isChecked!, item),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        const SizedBox(
          width: 10,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(iconColor),
          ),
          onPressed: cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(iconColor),
          ),
          onPressed: submit,
          child: const Text('Approve'),
        ),
      ],
    );
  }
}

class Cal extends StatefulWidget {
  String name;
  Cal({super.key, required this.name});

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  @override
  Widget build(BuildContext context) {
    final Widget calendar =
        Theme(data: ThemeData(), child: _getHeatMapCalendar());

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: appBarTextColor),
            onPressed: () => Navigator.of(context).pop(),
          ),

          title: Text(
            'MANGALDEEEP CLOTHING',
            style: TextStyle(color: appBarTextColor),
          ),
          backgroundColor: themeColor,
          // foregroundColor: themeColor,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  widget.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 0,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total absent days",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Card(
                                elevation: 3,
                                child: Container(
                                  color: kRed,
                                  height: 30,
                                  width: 30,
                                  child: const Center(
                                      child: Text('4',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300))),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total casual leaves",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Card(
                                elevation: 5,
                                child: Container(
                                  color: kBlue,
                                  height: 30,
                                  width: 30,
                                  child: const Center(
                                      child: Text('3',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300))),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total Present Days",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Card(
                                elevation: 5,
                                child: Container(
                                  color: kGreen,
                                  height: 30,
                                  width: 30,
                                  child: const Center(
                                      child: Text('23',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300))),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Divider(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Card(
                                    elevation: 5,
                                    child: Container(
                                      color: kRed,
                                      height: 18,
                                      width: 18,
                                      child: const Center(
                                          child: Text('A',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Absent",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Card(
                                    elevation: 5,
                                    child: Container(
                                      color: kBlue,
                                      height: 18,
                                      width: 18,
                                      child: const Center(
                                          child: Text('CL',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Casual Leaves",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Card(
                                    elevation: 5,
                                    child: Container(
                                      color: kGreen,
                                      height: 18,
                                      width: 18,
                                      child: const Center(
                                          child: Text('P',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Present",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: SizedBox(height: 370, child: calendar),
                ),
              ],
            ),
          ),
        ));
  }

  /// Returns the calendar widget based on the properties passed.
  SfCalendar _getHeatMapCalendar() {
    // bool isTap = false;
    return SfCalendar(
        headerStyle: CalendarHeaderStyle(
            textAlign: TextAlign.center,
            backgroundColor: iconColor,
            textStyle: const TextStyle(
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

  /// Returns the cell  text color based on the cell background color
  Color _getCellTextColor(Color backgroundColor) {
    return Colors.black;
  }

  /// Returns the builder for month cell.
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
          style: TextStyle(color: _getCellTextColor(backgroundColor)),
        ),
      ),
    );
  }

  Color _getMonthCellBackgroundColor(
      DateTime date, List abs, List pres, List lvs) {
    Color col = const Color.fromARGB(255, 224, 224, 224);
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
