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
  print("fetchTodosAction");
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

  store.dispatch(
    UpdateTodosAction(
      todosList: [
        todo1,
        todo2,
      ],
    ),
  );
}
