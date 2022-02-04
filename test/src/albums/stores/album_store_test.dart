import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

import 'package:value_notifier/src/albums/services/album_service.dart';
import 'package:value_notifier/src/albums/states/album_state.dart';
import 'package:value_notifier/src/albums/stores/album_store.dart';

class AlbumServiceMock extends Mock implements AlbumService {}

void main() {
  final service = AlbumServiceMock();
  final store = AlbumStore(service);

  test('Should change the AlbumState to Success', () async {
    when(() => service.getAlbums()).thenAnswer((_) async => []);
    expect(
      store,
      emitValues([
        isA<LoadingAlbumState>(),
        isA<SuccessAlbumState>(),
      ]),
    );
    await store.getAlbums();
    expect(store.value, isA<SuccessAlbumState>());
  });

  test('Should change the AlbumState to Error', () async {
    when(() => service.getAlbums()).thenThrow(Exception('Error'));
    expect(
      store,
      emitValues([
        isA<LoadingAlbumState>(),
        isA<ErrorAlbumState>(),
      ]),
    );
    await store.getAlbums();
    expect(store.value, isA<ErrorAlbumState>());
  });
}
