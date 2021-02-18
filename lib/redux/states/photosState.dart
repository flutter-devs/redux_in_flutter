import 'package:flutter/foundation.dart';
import 'package:redux_in_flutter/models/photosModel.dart';

@immutable
class PhotoState {
  final bool isFetching;
  final bool fetchingError;
  final List<Photos> photos;

  PhotoState({this.isFetching, this.photos, this.fetchingError});

  factory PhotoState.initial() {
    return PhotoState(isFetching: true, photos: [], fetchingError: null);
  }

  PhotoState copyWith(
      {bool isFetching, bool fetchingError, List<Photos> photos}) {
    return PhotoState(
        isFetching: isFetching ?? this.isFetching,
        fetchingError: fetchingError ?? this.fetchingError,
        photos: photos ?? this.photos);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoState &&
          runtimeType == other.runtimeType &&
          isFetching == other.isFetching &&
          fetchingError == other.fetchingError &&
          photos == other.photos;

  @override
  int get hashCode => isFetching.hashCode ^ photos.hashCode;
}
