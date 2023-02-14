// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:note_book_api/services/todo_service.dart';
import 'package:note_book_api/utils/snack_bar.dart';

//Todo: AddToPage
class AddTodoPage extends StatefulWidget {
  final Map? todo;
  const AddTodoPage({super.key, this.todo});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  //Todo: Edit-AddController
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'EditTdo' : 'AddTodo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const Divider(),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Description'),
            maxLines: 5,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              isEdit ? updateData() : submitData();
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                isEdit ? 'Update' : 'Submit',
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Todo: Body
  Map get body {
    //get the data from
    final title = titleController.text;
    final description = descriptionController.text;
    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }

  //Todo: SubmitData
  Future<void> submitData() async {
    final isSucess = await TodoService.addTodo(body);
    //Show sucess or fail message on Status
    if (isSucess) {
      titleController.text = '';
      descriptionController.text = '';
      showSucessMessage(context, message: 'Creation Sucess');
    } else {
      showErrorMessage(context, message: 'Creatiom Failed');
    }
  }

  //Todo: UpdateData
  Future<void> updateData() async {
    //get the data
    final todo = widget.todo;
    if (todo == null) {
      print('You can not call update without todo data');
      return;
    }
    final id = todo['_id'];
    //submit update data to the server
    final isSucess = await TodoService.updateTodo(id, body);
    //show sucess or fail message based on staus
    if (isSucess) {
      showSucessMessage(context, message: 'Update Sucess');
    } else {
      showErrorMessage(context, message: 'Update Failed');
    }
  }
}
