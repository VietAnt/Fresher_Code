// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//Todo: TodCard
class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;

  const TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  });

  @override
  Widget build(BuildContext context) {
    final id = item['_id'] as String;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${index + 1}'),
        ),
        title: Text(item['title']),
        subtitle: Text(item['description']),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              //open edit page
              navigateEdit(item);
            } else if (value == "delete") {
              //Delete and remote the items
              deleteById(id);
            }
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('Edit'),
                value: 'edit',
              ),
              PopupMenuItem(
                child: Text('Delete'),
                value: 'delete',
              ),
            ];
          },
        ),
      ),
    );
  }
}
