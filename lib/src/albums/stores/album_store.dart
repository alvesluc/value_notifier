import 'package:flutter/foundation.dart';

import '../services/album_service.dart';
import '../states/album_state.dart';

class AlbumStore extends ValueNotifier<AlbumState> {
  final AlbumService _albumService;

  AlbumStore(this._albumService) : super(InitialAlbumState());

  Future getAlbums() async {
    value = LoadingAlbumState();
    try {
      final albums = await _albumService.getAlbums();
      value = SuccessAlbumState(albums);
    } catch (e) {
      value = ErrorAlbumState(e.toString());
    }
  }
}
