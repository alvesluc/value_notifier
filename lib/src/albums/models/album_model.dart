import 'dart:convert';

class AlbumModel {
  final int id;
  final String title;

  AlbumModel({required this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumModel.fromJson(String source) => AlbumModel.fromMap(json.decode(source));

  @override
  String toString() => 'AlbumModel(id: $id, title: $title)';
}
