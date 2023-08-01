import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/redux/state/state.dart';

/// Questo metodo aggiunge dei TODO allo stato
class UpdateTodosAction {
  final List<TodoModel> todosList;

  UpdateTodosAction({
    required this.todosList,
  });
}

AppState updateTodosAction(
  AppState state,
  UpdateTodosAction action,
) {
  print("updateTodosAction");
  final stateTodos = state.todos;

  stateTodos.addAll(action.todosList);

  return state.copyWith(
    todos: stateTodos,
  );
}
