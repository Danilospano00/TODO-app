import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widget/add_todo_alert_dialog.dart';

class HomePage extends StatelessWidget {
  final List<TodoModel>? todos;

  HomePage({
    this.todos,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TODO APP",
          style: TextStyle(
            height: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: todos?.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              todos?[index].title ?? '',
            ),
            trailing: Text(
              todos?[index].description ?? '',
            ),
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AddTodoAlertDialog();
            },
          );
        },
        child: const CircleAvatar(
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
