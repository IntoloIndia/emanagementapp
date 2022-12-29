import 'package:emanagementapp/controller/api_controller.dart';
import 'package:emanagementapp/controller/controller.dart';
import 'package:emanagementapp/model/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerBills extends StatefulWidget {
  @override
  State<CustomerBills> createState() => _CustomerBillsState();
}

class _CustomerBillsState extends State<CustomerBills> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiController>(context, listen: false).CustomerList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Provider.of<ApiController>(context).CustomerList();
    final customerCont = Provider.of<ApiController>(context, listen: true);
    int customerLength = customerCont.customerLoading == false
        ? 0
        : int.parse(customerCont.customer.count.toString());
    int billLength = customerCont.billLoading == false
        ? 0
        : customerCont.bill.count.toString() == ""
            ? 0
            : int.parse(customerCont.bill.count.toString());
    // bool istap = false;
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              child: Container(
                height: height * 0.45,
                width: width,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Customers"),
                          Text(customerLength.toString()),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),

                    Consumer<ApiController>(
                      builder: (context, value, child) {
                        if (value.customerLoading == false) {
                          return Container();
                        } else {
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.customer.customers!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    customerCont.billList(int.parse(value
                                        .customer.customers![index].id
                                        .toString()));
                                  },
                                  child: Card(
                                    child: Container(
                                      margin: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text("${index + 1}"),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                value.customer.customers![index]
                                                    .customerName
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              value.customer.customers![index]
                                                  .mobileNo
                                                  .toString(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    )

                    // if (customerCont.customer == null)
                    //   ...[]
                    // else ...[
                    //   for (int i = 0;
                    //       i < customerCont.customer.customers!.length;
                    //       i++) ...[

                    //   ],
                    // ],

                    // ListView.builder(
                    //     shrinkWrap: true,
                    //     itemCount: customerCont.customer.count,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Card();
                    //     })
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              color: Colors.white,
              child: Container(
                height: height * 0.45,
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Bills count"),
                            Text("${billLength}")
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Consumer<ApiController>(builder: (context, value, child) {
                        if (value.billLoading == false) {
                          return Container();
                        }
                        return Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.bill.customerBills!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                  "Date : ${value.bill.customerBills![index].billDate}"),
                                            ),
                                            Align(
                                              child: Text(
                                                  "Bill number : ${value.bill.customerBills![index].id}"),
                                            ),
                                          ],
                                        ),
                                    const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                  "Amount : ${value.bill.customerBills![index].totalAmount}"),
                                            ),
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child:
                                                  Icon(Icons.padding_outlined),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },),
                        );
                      })
                      // if(customerCont.bill == null) ...[
                      //   Text("data")
                      // ] else ...[
                      //   for (int i = 0;
                      //       i < customerCont.bill.customerBills!.length;
                      //       i++)
                      //     Row(
                      //       children: [
                      //         Card(
                      //           child: Text(customerCont
                      //               .bill.customerBills![i].billTime
                      //               .toString()),
                      //         )
                      //       ],
                      //     )
                      // ]
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
