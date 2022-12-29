import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

const Color _kLightGrey = Color.fromRGBO(238, 238, 238, 1);
const Color _kGreen = Color.fromRGBO(35, 154, 59, 1);
const Color _kRed = Color.fromARGB(255, 206, 63, 37);

class Cal extends StatefulWidget {
  const Cal({super.key});

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  
  List hours = [9, 2, 12, 4, 20];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final Widget calendar =
        Theme(data: ThemeData(), child: _getHeatMapCalendar());

    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                      color: const Color.fromARGB(255, 233, 233, 233),
                      child: calendar),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the calendar widget based on the properties passed.
  SfCalendar _getHeatMapCalendar() {
    return SfCalendar(
        showNavigationArrow: true,
        view: CalendarView.month,
        monthCellBuilder: _monthCellBuilder,
        showDatePickerButton: true,
        monthViewSettings: const MonthViewSettings(
          showTrailingAndLeadingDates: false,
        ));
  }

  /// Returns the cell  text color based on the cell background color
  Color _getCellTextColor(Color backgroundColor) {
    if (backgroundColor == _kRed) {
      return Colors.white;
    }

    return Colors.black;
  }

  /// Returns the builder for month cell.
  Widget _monthCellBuilder(
      BuildContext buildContext, MonthCellDetails details) {
    final Color backgroundColor =
        _getMonthCellBackgroundColor(details.date, hours);
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

  Color _getMonthCellBackgroundColor(DateTime date, List ho) {
    Color col = Colors.red;
    // ignore: unused_local_variable
    int leave = ho[i];
    // ignore: unused_local_variable
    int day = date.day;
    for (var i = 0; i < ho.length; i++) {
      if (date.day == ho[i]) {
        col = _kGreen;
      }
    }

    // }
    return col;
  }
}
