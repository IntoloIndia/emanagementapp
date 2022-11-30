import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      Text(
                        "Absent ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: width * 0.14,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            Center(child: CircularProgressIndicator())
                          ] else ...[
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.all(10),
                                    child: const Text(
                                      "Name",
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Status",
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
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
                                          borderRadius:
                                              BorderRadius.circular(2)),
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
                )),
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

class MultiSelect extends StatefulWidget {
  List<String> items;

  MultiSelect({required this.items});
  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> selectedItems = [];

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
