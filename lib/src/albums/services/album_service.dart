import 'package:uno/uno.dart';

import '../models/album_model.dart';

class AlbumService {
  final Uno uno;

  AlbumService(this.uno);

  Future<List<AlbumModel>> getAlbums() async {
    String url = 'https://jsonplaceholder.typicode.com/albums';

    final response = await uno.get(url);
    final list = response.data as List;
    final albums = list.map((e) => AlbumModel.fromMap(e)).toList();

    return albums;
  }

  Future<AlbumModel> addAlbum() async {
    String url = 'https://jsonplaceholder.typicode.com/albums';

    final response = await uno.post(url, data: {
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    });

    final newAlbum = AlbumModel.fromMap(response.data);
    
    return newAlbum;
  }
}
