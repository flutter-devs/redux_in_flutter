import 'package:redux_in_flutter/models/photosModel.dart';

class GetPhotosLoadingAction {}

class GetPhotosSuccessAction {
  final List<Photos> photos;
  GetPhotosSuccessAction({this.photos});
}

class GetPhotosFailedAction {}
