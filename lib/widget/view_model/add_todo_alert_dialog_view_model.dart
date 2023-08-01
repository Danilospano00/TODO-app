import 'package:redux/redux.dart';
import 'package:todo_app/redux/state/actions/add_todo_action.dart';
import 'package:todo_app/redux/state/state.dart';

class AddTodoAlertDialogViewModel {
  final Function(String, String, bool) addTodo;

  AddTodoAlertDialogViewModel({
    required this.addTodo,
  });

  factory AddTodoAlertDialogViewModel.create(Store<AppState> store) {
    return AddTodoAlertDialogViewModel(
      addTodo: (title, desc, isRelevant) {
        store.dispatch(
          AddTodoAction(
            title: title,
            description: desc,
            isRelevant: isRelevant,
          ),
        );
      },
    );
  }
}
