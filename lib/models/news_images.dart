import 'package:meta/meta.dart';
import 'dart:convert';

class BosconetNewsImages {
  BosconetNewsImages({
    required this.newsImages,
    required this.success,
    required this.message,
  });

  List<NewsImage> newsImages;
  int success;
  String message;

  factory BosconetNewsImages.fromJson(String str) => BosconetNewsImages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BosconetNewsImages.fromMap(Map<String, dynamic> json) => BosconetNewsImages(
    newsImages: List<NewsImage>.from(json["newsimages"].map((x) => NewsImage.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "newsimages": List<dynamic>.from(newsImages.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class NewsImage {
  NewsImage({
    required this.id,
    required this.newsId,
    required this.image,
    required this.updatedAt,
  });

  String id;
  String newsId;
  String image;
  DateTime updatedAt;

  factory NewsImage.fromJson(String str) => NewsImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsImage.fromMap(Map<String, dynamic> json) => NewsImage(
    id: json["id"],
    newsId: json["news_id"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "news_id": newsId,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
  };
}
