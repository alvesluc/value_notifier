
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';

import 'albums/albums_page.dart';
import 'albums/services/album_service.dart';
import 'albums/stores/album_store.dart';

class ValueNotifierApp extends StatelessWidget {
  const ValueNotifierApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Uno()),
        Provider(create: (context) => AlbumService(context.read())),
        ChangeNotifierProvider(create: (context) => AlbumStore(context.read())),
      ],
      child: MaterialApp(
        title: 'ValueNotifier Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AlbumsPage(),
      ),
    );
  }
}
