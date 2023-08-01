import 'package:todo_app/redux/state/actions/update_relevancy_action.dart';
import 'package:todo_app/redux/state/actions/update_todos_action.dart';
import 'package:todo_app/redux/state/state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is UpdateTodosAction) {
    return updateTodosAction(state, action);
  }
  if (action is UpdateRelevancyAction) {
    return updateRelevancyAction(state, action);
  }

  return AppState(
    todos: state.todos,
  );
}
