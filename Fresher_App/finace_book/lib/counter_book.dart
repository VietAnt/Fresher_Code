import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterBook extends StatefulWidget {
  const CounterBook({
    super.key,
  });

  @override
  State<CounterBook> createState() => _CounterBookState();
}

class _CounterBookState extends State<CounterBook> {
  TextEditingController nameController = TextEditingController();
  TextEditingController counterController = TextEditingController();
  bool? isChecked = false;
  double total = 0;
  int totalCustomer = 0;
  int totalCusVip = 0;
  double totalCount = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    // Obtain shared preferences.
    final total_data = await SharedPreferences.getInstance();
    setState(() {
      total = total_data.getDouble('total') ?? 0;
    });
  }

  void countbook() async {
    final total_data = await SharedPreferences.getInstance();
    if (isChecked == true) {
      setState(() {
        total = int.parse(counterController.text) * 20000 -
            (int.parse(counterController.text) * 20000 * 0.1);
        total_data.setDouble('total', total);
      });
    } else {
      setState(() {
        total = int.parse(counterController.text) * 20000;
        total_data.setDouble('total', total);
      });
    }
  }

  void counterCustomer() {
    setState(() {
      if (isChecked == true) {
        totalCusVip += 1;
      }
      nameController.text = '';
      counterController.text = '';
      totalCustomer += 1;
      totalCount += total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chương trình bán sách'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Tên Khách Hàng:'),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 150,
                  child: TextField(
                    controller: nameController,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Số lượng sách:'),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 150,
                  child: TextField(
                    controller: counterController,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Khách Hàng Vip',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Checkbox(
                      value: isChecked,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool;
                        });
                      },
                      activeColor: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Thành Tiền:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 150,
                    color: const Color.fromARGB(255, 147, 231, 149),
                    child: Center(
                      child: Text(
                        '$total',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  color: Colors.blueGrey,
                  child: TextButton(
                    onPressed: () {
                      countbook();
                    },
                    child: const Text(
                      'TÍNH TT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  color: Colors.blueGrey,
                  child: TextButton(
                    onPressed: () {
                      counterCustomer();
                    },
                    child: const Text(
                      'TIẾP',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  color: Colors.blueGrey,
                  child: TextButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            content: Text('$totalCount'),
                            title: const Text('Tổng Doanh Thu:'),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('OK'),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'THỐNG KÊ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueGrey,
                    child: const Center(
                      child: Text(
                        'Thông Tin Thống Kê',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng số KH: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 200,
                        child: Center(
                          child: Text(
                            '$totalCustomer',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng số KH là VIP: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 200,
                        child: Center(
                          child: Text(
                            '$totalCusVip',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng Doanh Thu: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 200,
                        child: Center(
                          child: Text(
                            '$totalCount',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('Thoát Ứng Dụng'),
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('OK'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('No'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.exit_to_app_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
