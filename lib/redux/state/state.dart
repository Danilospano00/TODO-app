import 'package:equatable/equatable.dart';
import 'package:todo_app/models/todo_model.dart';

class AppState extends Equatable {
  final List<TodoModel> todos;

  AppState({
    required this.todos,
  });

  factory AppState.initial() {
    return AppState(todos: []);
  }

  AppState copyWith({
    List<TodoModel>? todos,
  }) {
    return AppState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [
        this.todos,
      ];
}
