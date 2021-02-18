import 'package:redux_in_flutter/models/photosModel.dart';

import 'package:http/http.dart' as http;

class RemoteServices {
  static String baseUrl = 'https://picsum.photos/v2/list';

  static Future<List<Photos>> getPhotos() async {
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      return photosFromJson(response.body);
    } else {
      throw Exception('Couldn\'t fetch the data');
    }
  }
}
