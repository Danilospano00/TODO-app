import 'package:redux/redux.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/redux/state/actions/update_todos_action.dart';
import 'package:todo_app/redux/state/state.dart';

class AddTodoAction {
  final String title;
  final String description;
  final bool isRelevant;

  AddTodoAction({
    required this.title,
    required this.description,
    required this.isRelevant,
  });
}

void addTodosAction(
  Store<AppState> store,
  AddTodoAction action,
  next,
) async {
  final TodoModel todoModel = TodoModel(
    title: action.title,
    description: action.description,
    isRelevant: action.isRelevant,
  );

  store.dispatch(
    UpdateTodosAction(
      todosList: [todoModel],
    ),
  );
}
