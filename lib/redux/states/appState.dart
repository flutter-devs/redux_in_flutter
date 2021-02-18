import 'package:flutter/material.dart';
import 'package:redux_in_flutter/redux/states/photosState.dart';

@immutable
class AppState {
  final PhotoState photoState;

  AppState({
    @required this.photoState,
  });

  factory AppState.initial() {
    return AppState(
      photoState: PhotoState.initial(),
    );
  }

  AppState copyWith({
    PhotoState photoState,
  }) {
    return AppState(
      photoState: photoState ?? this.photoState,
    );
  }

  @override
  int get hashCode => photoState.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState && photoState == other.photoState;
}
