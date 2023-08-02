import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/redux/state/state.dart';
import 'package:todo_app/widget/view_model/add_todo_alert_dialog_view_model.dart';

class AddTodoAlertDialog extends StatefulWidget {
  AddTodoAlertDialog({Key? key}) : super(key: key);

  @override
  State<AddTodoAlertDialog> createState() => _AddTodoAlertDialogState();
}

class _AddTodoAlertDialogState extends State<AddTodoAlertDialog> {
  final TextEditingController titleTodo = TextEditingController();

  final TextEditingController descriptionTodo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AddTodoAlertDialogViewModel>(
      converter: (store) => AddTodoAlertDialogViewModel.create(store),
      builder: (context, vm) => Card(
        margin: const EdgeInsets.symmetric(
          vertical: 220,
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: titleTodo,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                    0,
                    8,
                    0,
                    8,
                  ),
                  labelText: "Titolo",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                cursorHeight: 18,
                controller: descriptionTodo,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  labelText: "Descrizione",
                ),
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
                      if (titleTodo.text.isNotEmpty ||
                          descriptionTodo.text.isNotEmpty) {
                        vm.addTodo(
                          titleTodo.text,
                          descriptionTodo.text,
                          false,
                        );
                        Navigator.pop(context);
                      }
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
