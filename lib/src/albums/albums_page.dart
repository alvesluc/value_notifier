import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'states/album_state.dart';
import 'stores/album_store.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context.read<AlbumStore>().getAlbums();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AlbumStore>();
    final state = store.value;
    Widget? child;

    if (state is LoadingAlbumState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorAlbumState) {
      child = Center(
        child: Text(state.message),
      );
    }
    if (state is SuccessAlbumState) {
      child = ListView.builder(
        itemCount: state.albums.length,
        itemBuilder: (_, i) {
          final album = state.albums[i];
          return ListTile(
            title: Text(album.title),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: child ?? Container(),
    );
  }
}
