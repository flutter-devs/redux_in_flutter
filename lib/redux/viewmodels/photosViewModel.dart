import 'package:redux/redux.dart';
import 'package:redux_in_flutter/models/photosModel.dart';
import 'package:redux_in_flutter/redux/states/appState.dart';

class PhotosViewModel {
  final bool isFetching;
  final bool fetchingError;
  final List<Photos> photos;

  PhotosViewModel({this.isFetching, this.fetchingError, this.photos});

  factory PhotosViewModel.fromStore(Store<AppState> store) => PhotosViewModel(
      isFetching: store.state.photoState.isFetching,
      photos: store.state.photoState.photos,
      fetchingError: store.state.photoState.fetchingError);
}
