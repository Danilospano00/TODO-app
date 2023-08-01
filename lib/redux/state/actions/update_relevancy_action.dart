import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/redux/state/state.dart';

class UpdateRelevancyAction {
  final TodoModel todoModel;

  UpdateRelevancyAction({
    required this.todoModel,
  });
}

AppState updateRelevancyAction(
  AppState state,
  UpdateRelevancyAction action,
) {
  final stateTodos = state.todos;

  int index = stateTodos.indexOf(
    action.todoModel,
  );
  for (int i = 0; i <= index; i++) {
    if (i == index) {
      stateTodos[i].isRelevant = !stateTodos[i].isRelevant;
    }
  }
  return state.copyWith(
    todos: stateTodos,
  );
}
