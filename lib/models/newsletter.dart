// To parse this JSON data, do
//
//     final newsLetter = newsLetterFromMap(jsonString);

import 'dart:convert';

class NewsLetter {
  NewsLetter({
    required this.bosconetNewsletter,
    required this.success,
    required this.message,
  });

  List<BosconetNewsletter> bosconetNewsletter;
  int success;
  String message;

  factory NewsLetter.fromJson(String str) =>
      NewsLetter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsLetter.fromMap(Map<String, dynamic> json) => NewsLetter(
        bosconetNewsletter: List<BosconetNewsletter>.from(
            json["bosconet_newsletter"]
                .map((x) => BosconetNewsletter.fromMap(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "bosconet_newsletter":
            List<dynamic>.from(bosconetNewsletter.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class BosconetNewsletter {
  BosconetNewsletter({
    required this.id,
    required this.image,
    required this.title,
    required this.date,
    required this.pdf,
    required this.updatedAt,
  });

  String id;
  String image;
  String title;
  String date;
  String pdf;
  DateTime updatedAt;

  factory BosconetNewsletter.fromJson(String str) =>
      BosconetNewsletter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BosconetNewsletter.fromMap(Map<String, dynamic> json) =>
      BosconetNewsletter(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        date: json["date"],
        pdf: json["pdf"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "title": title,
        "date": date,
        "pdf": pdf,
        "updated_at": updatedAt.toIso8601String(),
      };
}
