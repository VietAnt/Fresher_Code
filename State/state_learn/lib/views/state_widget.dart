import 'package:flutter/material.dart';
import 'package:state_learn/source/more_widget.dart';

class StateWidget extends StatefulWidget {
  final String userName;
  final String age;

  //contructor//
  const StateWidget({
    super.key,
    required this.userName,
    required this.age,
  });

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: informationWidget(
            userNameContent: widget.userName,
            ageContent: widget.age,
          ),
        ),
      ),
    );
  }
}
