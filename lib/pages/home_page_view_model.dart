import 'package:redux/redux.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/redux/state/state.dart';

class HomePageViewModel {
  final List<TodoModel> todos;

  HomePageViewModel({
    required this.todos,
  });

  factory HomePageViewModel.create(Store<AppState> store) {
    return HomePageViewModel(
      todos: store.state.todos,
    );
  }
}
