import 'dart:convert';

import 'package:bosconet/api_services/api_service.dart';
import 'package:bosconet/models/news_images.dart';

class News {
  News({
    required this.bosconetNews,
    required this.success,
    required this.message,
  });

  List<BosconetNews> bosconetNews;
  int success;
  String message;

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory News.fromMap(Map<String, dynamic> json) => News(
        bosconetNews: List<BosconetNews>.from(
            json["bosconet_news"].map((x) => BosconetNews.fromMap(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "bosconet_news": List<dynamic>.from(bosconetNews.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class BosconetNews {
  BosconetNews({
    required this.id,
    required this.sImg,
    required this.lImg,
    required this.title,
    required this.date,
    required this.description,
    required this.updatedAt,
  });

  String id;
  String sImg;
  String lImg;
  String title;
  String date;
  String description;
  DateTime updatedAt;


  factory BosconetNews.fromJson(String str) =>
      BosconetNews.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BosconetNews.fromMap(Map<String, dynamic> json) => BosconetNews(
        id: json["id"],
        sImg: json["s_img"],
        lImg: json["l_img"],
        title: json["title"],
        date: json["date"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "s_img": sImg,
        "l_img": lImg,
        "title": title,
        "date": date,
        "description": description,
        "updated_at": updatedAt.toIso8601String(),
      };
}
