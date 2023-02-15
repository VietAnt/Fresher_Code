// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_learn/source/more_widget.dart';
import 'package:state_learn/source/strings.dart';
import 'package:state_learn/views/saved_information.dart';
import 'package:state_learn/views/state_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //1. Tao ra State 2.Gan State-Context: context = 1 widget
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? usernameController, birthYearController;
  String userName = NOT_DEFINE;
  String age = NOT_DEFINE;
  //shared preferences.
  final _prefs = SharedPreferences.getInstance();

  //3.Khoi tao State
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    birthYearController = TextEditingController();
    //1.Khoi tao State
    //2.Duoc dung de dat truoc lenh thuc thi build: load du lieu tu CSDL
    //3. Context khong hoat dong
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(USER_INFORMATION),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              //Ten_Widget
              textInputWidget(
                labelText: USER_NAME,
                hintText: USER_NAME_HERE,
                controller: usernameController,
              ),
              //Nam Sinh Widget
              textInputWidget(
                labelText: BIRTH_YEAR,
                hintText: BIRTH_YEAR_HERE,
                controller: birthYearController,
              ),
              //Todo: Button
              TextButton(
                onPressed: () {
                  //Todo: Ham SetState: build lại toàn bộ widget, kể cả widget ko liên quan
                  setState(() {
                    userName = usernameController!.text;
                    age = (DateTime.now().year -
                            int.parse(birthYearController!.text))
                        .toString();
                  });
                  storeInformation(userName: userName, age: age);
                },
                child: const Text(CONFIRM),
              ),
              //Todo: InformationWidget
              informationWidget(
                userNameContent: userName,
                ageContent: age,
              ),

              //Todo: TextButton
              TextButton(
                onPressed: () {
                  var route = MaterialPageRoute(
                    builder: (context) =>
                        StateWidget(userName: userName, age: age),
                  );
                  Navigator.push(context, route);
                },
                child: const Text(NEXT_PAGE),
              ),
              TextButton(
                onPressed: () {
                  Get.to(SavedInformation());
                },
                child: const Text(VIEW_SAVED_INFORMATION),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Todo: Lưu thông tin vào sharedpreference ( key: value ) ; int , double , String , bool
  storeInformation({required String userName, required String age}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(
        "information", USER_NAME + ":" + userName + "\n" + AGE + ":" + age);
    print("Saved Information");
  }
}
