import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/home_page_view_model.dart';
import 'package:todo_app/redux/state/state.dart';

class HomePageStoreConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      converter: (store) => HomePageViewModel.create(store),
      builder: (context, vm) {
        if (vm.todos.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return HomePage(
            todos: vm.todos,
          );
        }
      },
    );
  }
}
