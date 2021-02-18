import 'package:redux_in_flutter/redux/reducers/photosReducer.dart';
import 'package:redux_in_flutter/redux/states/appState.dart';

AppState appReducer(AppState state, action) {
  return AppState(photoState: photosReducer(state.photoState, action));
}
