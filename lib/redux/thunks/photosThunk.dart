import 'package:redux/redux.dart';
import 'package:redux_in_flutter/redux/actions/photosAction.dart';
import 'package:redux_in_flutter/redux/states/appState.dart';
import 'package:redux_in_flutter/services/remoteServices.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> getPhotosThunk() => (Store<AppState> store) async {
      try {
        store.dispatch(GetPhotosLoadingAction());
        final photos = await RemoteServices.getPhotos();
        store.dispatch(GetPhotosSuccessAction(photos: photos));
      } catch (error) {
        store.dispatch(GetPhotosFailedAction());
      }
    };
