import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/redux/state/actions/update_relevancy_action.dart';
import 'package:todo_app/redux/store.dart';
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
            fontWeight: FontWeight.bold,
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
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          todos?[index].description ?? '',
                        ),
                        GestureDetector(
                          onTap: () {
                            appStore.dispatch(
                              UpdateRelevancyAction(
                                todoModel: todos![index],
                              ),
                            );
                          },
                          child: todos?[index].isRelevant == true
                              ? const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                )
                              : const Icon(
                                  Icons.star_border,
                                  color: Colors.orange,
                                ),
                        ),
                      ],
                    ),
                  ),
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
