import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../controller/controller.dart';

class Leaves extends StatefulWidget {
  const Leaves({super.key});

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  List<String> items1 = [];
  List<String> items2 = [];

  @override
  void initState() {
    print(Provider.of<Controller>(context, listen: false).userData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        child: Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black12,
              //<-- SEE HERE
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          margin: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Divider(
                //   thickness: 2,
                // ),
                const Text(
                  "Employee Status",
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
                    Text(
                      "Toatal Employee",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      child: Text(
                        '20',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: iconColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Absent Employee",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: iconColor,
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
                      "present Employee",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      child: Text(
                        '18',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: iconColor,
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
          margin: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Divider(
                //   thickness: 2,
                // ),
                const Text(
                  "Employee Applied For Leave",
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
                          color: iconColor,
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(color: Colors.black54)
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Leave",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                          color: iconColor,
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(color: Colors.black54)
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Leave",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
        )
      ],
    ));
  }
}

class MultiSelect extends StatefulWidget {
  List<String> items;

  MultiSelect({required this.items});
  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> selectedItems = [];

  void itemChanges(bool isSelected, String itemValue) {
    setState(() {
      if (isSelected) {
        selectedItems.add(itemValue);
      } else {
        selectedItems.remove(itemValue);
      }
    });
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
        // ElevatedButton(
        //   style: ButtonStyle(
        //     backgroundColor:
        //         MaterialStateProperty.all<Color>(iconColor),
        //   ),
        //   onPressed: clear,
        //   child: const Text('clear all'),
        // ),
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
