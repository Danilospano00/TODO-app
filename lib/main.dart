import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/pages/home_page_store_connector.dart';
import 'package:todo_app/redux/state/actions/fetch_todos_action.dart';
import 'package:todo_app/redux/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: appStore.dispatch(
        FetchTodosAction(),
      ),
      builder: (context, snapshot) {
        return StoreProvider(
          store: appStore,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
              useMaterial3: true,
            ),
            home: HomePageStoreConnector(),
          ),
        );
      },
    );
  }
}
