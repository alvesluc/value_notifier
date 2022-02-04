import '../models/album_model.dart';

abstract class AlbumState {}

class InitialAlbumState extends AlbumState {}

class LoadingAlbumState extends AlbumState {}

class SuccessAlbumState extends AlbumState {
  final List<AlbumModel> albums;

  SuccessAlbumState(this.albums);
}

class ErrorAlbumState extends AlbumState {
  final String message;

  ErrorAlbumState(this.message);
}
