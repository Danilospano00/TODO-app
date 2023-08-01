import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/redux/state/state.dart';
import 'package:todo_app/widget/view_model/add_todo_alert_dialog_view_model.dart';

class AddTodoAlertDialog extends StatelessWidget {
  AddTodoAlertDialog({Key? key}) : super(key: key);

  final TextEditingController titleTodo = TextEditingController();
  final TextEditingController descriptionTodo = TextEditingController();
  final bool isRelevant = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AddTodoAlertDialogViewModel>(
      converter: (store) => AddTodoAlertDialogViewModel.create(store),
      builder: (context, vm) => Card(
        margin: const EdgeInsets.symmetric(
          vertical: 150,
          horizontal: 50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Aggiungi TODO",
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: titleTodo,
              ),
              TextField(
                controller: descriptionTodo,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Annulla",
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      vm.addTodo(
                        titleTodo.text,
                        descriptionTodo.text,
                        isRelevant,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Aggiungi",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
