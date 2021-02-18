import 'package:redux/redux.dart';
import 'package:redux_in_flutter/redux/reducers/appReducers.dart';
import 'package:redux_in_flutter/redux/states/appState.dart';
import 'package:redux_thunk/redux_thunk.dart';

class Redux {
  static final Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: new AppState.initial(),
    middleware: [thunkMiddleware],
  );

  static Store<AppState> get store => _store;
}
