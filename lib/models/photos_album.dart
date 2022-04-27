// To parse this JSON data, do
//
//     final photosAlbums = photosAlbumsFromMap(jsonString);

import 'dart:convert';

class PhotosAlbums {
  PhotosAlbums({
    required this.bosconetPhotos,
    required this.success,
    required this.message,
  });

  List<BosconetPhotoAlbum> bosconetPhotos;
  int success;
  String message;

  factory PhotosAlbums.fromJson(String str) => PhotosAlbums.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PhotosAlbums.fromMap(Map<String, dynamic> json) => PhotosAlbums(
    bosconetPhotos: List<BosconetPhotoAlbum>.from(json["bosconet_photos"].map((x) => BosconetPhotoAlbum.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "bosconet_photos": List<dynamic>.from(bosconetPhotos.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class BosconetPhotoAlbum {
  BosconetPhotoAlbum({
    required this.id,
    required this.title,
    required this.image,
    required this.updatedAt,
  });

  String id;
  String title;
  String image;
  DateTime updatedAt;

  factory BosconetPhotoAlbum.fromJson(String str) => BosconetPhotoAlbum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BosconetPhotoAlbum.fromMap(Map<String, dynamic> json) => BosconetPhotoAlbum(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
  };
}
