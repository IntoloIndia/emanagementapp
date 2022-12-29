import 'package:emanagementapp/constant.dart';
import 'package:emanagementapp/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DatePicker extends StatefulWidget {
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  List<String> selectedItems = [];

  List ListAvailableSubCategory = [];

  Future? SubCate;

  int availableSubCategoryId = 0;

  DateTime now = DateTime.now();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _secondController = TextEditingController();

  void cancel() {
    Navigator.pop(context);
  }

  void clear() {
    setState(
      () {
        selectedItems = [];
        Navigator.pop(context, selectedItems);
      },
    );
  }

  bool isPresent = false;

  DateFormat formatter = DateFormat("dd-MM-yyyy");

  @override
  void initState() {
    final DateFormat formatter = DateFormat("dd-MM-yyyy");
    final String formatted = formatter.format(now);

    _dateController.text = formatted;

    _secondController.text = formatted;

    // TODO: implement initState
    super.initState();
  }

  void submit() {
    selectedItems = [];
    selectedItems.add(_dateController.toString());
    selectedItems.add(_secondController.text);
    Navigator.pop(context, selectedItems);
  }

  String? setDate;
  String? setSecondDate;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = formatter.format(selectedDate);
      });
    }
  }

  Future<Null> _secondDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _secondController.text = formatter.format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Text("Select Date"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    const Text(
                      'From Date',
                      style: TextStyle(letterSpacing: 0.5),
                    ),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                          onSaved: (val) {
                            setDate = val;
                          },
                          decoration: const InputDecoration(
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.only(top: 0.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'To Date',
                      style: TextStyle(
                        letterSpacing: 0.5
                        ),
                    ),
                    InkWell(
                      onTap: () {
                        _secondDate(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _secondController,
                          onSaved: (val) {
                            setSecondDate = val;
                          },
                          decoration: const InputDecoration(
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.only(top: 0.0)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
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
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
