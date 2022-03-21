import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

import 'package:value_notifier/src/albums/services/album_service.dart';

class UnoMock extends Mock implements Uno {}
class RequestMock extends Mock implements Request {}

void main() {
  final unoMock = UnoMock();
  final service = AlbumService(unoMock);

  test('Should get all albums', () async {
    when(() => unoMock.get(any())).thenAnswer(
      (_) async => Response(
        headers: {},
        request: RequestMock(),
        status: 200,
        data: jsonResponse,
      ),
    );
    final albums = await service.getAlbums();
    expect(albums[0].title, 'quidem molestiae enim');
  });

  test('Should add a new album', () async {
    when(() => unoMock.post(any(), data: any(named: 'data'))).thenAnswer(
      (_) async => Response(
        headers: {},
        request: RequestMock(),
        status: 200,
        data: {
          'id': 101
        },
      ),
    );
    final albums = await service.addAlbum();
    expect(albums.id, 101);
  });
}

final jsonResponse = jsonDecode(r'''
[
  {
    "userId": 1,
    "id": 1,
    "title": "quidem molestiae enim"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "sunt qui excepturi placeat culpa"
  },
  {
    "userId": 1,
    "id": 3,
    "title": "omnis laborum odio"
  },
  {
    "userId": 1,
    "id": 4,
    "title": "non esse culpa molestiae omnis sed optio"
  },
  {
    "userId": 1,
    "id": 5,
    "title": "eaque aut omnis a"
  }
]
''');
