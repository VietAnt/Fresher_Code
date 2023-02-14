// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:note_book_api/screens/add_page.dart';
import 'package:note_book_api/services/todo_service.dart';
import 'package:note_book_api/utils/snack_bar.dart';
import 'package:note_book_api/widget/todo_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTodod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo List'),
      ),
      body: Visibility(
        child: const Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: () => fetchTodod(),
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text(
                "No Todo Item",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                final id = item['_id'] as String;
                return TodoCard(
                  index: index,
                  item: item,
                  navigateEdit: navigateToEditPage,
                  deleteById: deleteById,
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => navigateAddPage(),
        label: const Text('Add Todo'),
      ),
    );
  }

  //Todo: fetchTodo
  Future<void> fetchTodod() async {
    final response = await TodoService.fetchTodos();
    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      showErrorMessage(context, message: "Something went wrong");
    }
    setState(() {
      isLoading = false;
    });
  }

  //Todo: NavigateEditPage: Chinh Sua
  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(todo: item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodod();
  }

  //Todo: NavigateToAddPage: Them Moi
  Future<void> navigateAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodod();
  }

  //Todo: deleteById
  Future<void> deleteById(String id) async {
    //Delete the item
    final isSucess = await TodoService.deleteById(id);
    if (isSucess) {
      //remove item from the list
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      showErrorMessage(context, message: 'Delete Fialed');
    }
  }
}
