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
      body: ListView(
        children: [
          ...List.generate(
            todos?.length ?? 0,
            (index) {
              return SizedBox(
                height: 80,
                child: Card(
                  margin: const EdgeInsets.all(
                    16,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          todos?[index].title ?? '',
                        ),
                        Text(
                          todos?[index].description ?? '',
                        ),
                        todos?[index].isRelevant == true
                            ? const Icon(
                                Icons.star,
                                color: Colors.orange,
                              )
                            : const Icon(
                                Icons.star_border,
                                color: Colors.orange,
                              ),
                      ],
                    ),
                  ),
                ),
              );
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
          const SizedBox(
            height: 80,
          ),
        ],
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
