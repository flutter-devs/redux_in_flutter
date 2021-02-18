import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:redux_in_flutter/redux/states/appState.dart';
import 'package:redux_in_flutter/redux/thunks/photosThunk.dart';
import 'package:redux_in_flutter/redux/viewmodels/photosViewModel.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: body(context),
    );
  }

  appbar(BuildContext context) {
    return AppBar(
      title: Text("Redux In Flutter"),
    );
  }

  body(BuildContext context) {
    return StoreConnector<AppState, PhotosViewModel>(
      onInit: (store) {
        store.dispatch(getPhotosThunk());
      },
      converter: (store) => PhotosViewModel.fromStore(store),
      builder: (BuildContext context, viewModel) {
        if (viewModel.isFetching) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              itemCount: viewModel.photos.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        color: Colors.grey[200],
                        blurRadius: 12,
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: viewModel.photos[index].downloadUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              },
            ),
          );
        }
      },
    );
  }
}
