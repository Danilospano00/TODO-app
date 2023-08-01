import 'package:redux/redux.dart';
import 'package:todo_app/redux/state/actions/fetch_todos_action.dart';
import 'package:todo_app/redux/state/state.dart';

List<Middleware<AppState>> appMiddleware() {
  return [
    TypedMiddleware<AppState, FetchTodosAction>(
      fetchTodosAction,
    ),
  ];
}
