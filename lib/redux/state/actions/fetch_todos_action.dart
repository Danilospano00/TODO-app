import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/redux/state/actions/update_todos_action.dart';
import 'package:todo_app/redux/state/state.dart';

class FetchTodosAction {}

void fetchTodosAction(
  Store<AppState> store,
  FetchTodosAction action,
  next,
) async {
  final todo1 = TodoModel(
    title: "title1",
    description: "description1",
    isRelevant: false,
  );

  final todo2 = TodoModel(
    title: "title2",
    description: "description2",
    isRelevant: false,
  );

  try {
    final response = await http.get(
      Uri.parse("http://localhost:8080/getAll"),
    );
    print(response.body);
    var userMap = jsonDecode(response.body);
    List<TodoModel> todoList = [];
    userMap.forEach((map) {
      todoList.add(TodoModel.fromJson(map));
    });
    store.dispatch(
      UpdateTodosAction(
        todosList: todoList,
      ),
    );
  } catch (e) {
    throw Exception();
  }
}
