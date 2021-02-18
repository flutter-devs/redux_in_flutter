import 'package:redux/redux.dart';
import 'package:redux_in_flutter/redux/actions/photosAction.dart';
import 'package:redux_in_flutter/redux/states/photosState.dart';

final photosReducer = combineReducers<PhotoState>([
  TypedReducer<PhotoState, GetPhotosSuccessAction>(_getPhotosSuccess),
  TypedReducer<PhotoState, GetPhotosFailedAction>(_getPhotosFailed),
  TypedReducer<PhotoState, GetPhotosLoadingAction>(_getPhotosLoading),
]);
PhotoState _getPhotosSuccess(PhotoState state, GetPhotosSuccessAction action) {
  return state.copyWith(
      photos: action.photos, isFetching: false, fetchingError: false);
}

PhotoState _getPhotosFailed(PhotoState state, GetPhotosFailedAction action) {
  return state.copyWith(photos: null, isFetching: false, fetchingError: true);
}

PhotoState _getPhotosLoading(PhotoState state, GetPhotosLoadingAction action) {
  return state.copyWith(isFetching: true, fetchingError: false);
}
