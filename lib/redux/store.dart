import 'package:redux/redux.dart';
import 'package:todo_app/redux/state/app_middleware.dart';
import 'package:todo_app/redux/state/app_reducer.dart';
import 'package:todo_app/redux/state/state.dart';

final Store<AppState> appStore = Store<AppState>(
  appReducer,
  middleware: appMiddleware(),
  initialState: AppState.initial(),
);
