import 'dart:convert';

class SuccessStories {
  SuccessStories({
    required this.successStory,
    required this.success,
    required this.message,
  });

  List<BosconetSuccessStories> successStory;
  int success;
  String message;

  factory SuccessStories.fromJson(String str) =>
      SuccessStories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SuccessStories.fromMap(Map<String, dynamic> json) => SuccessStories(
        successStory: List<BosconetSuccessStories>.from(
            json["success_story"].map((x) => BosconetSuccessStories.fromMap(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success_story": List<dynamic>.from(successStory.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class BosconetSuccessStories {
  BosconetSuccessStories({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.updatedAt,
  });

  String id;
  String image;
  String title;
  String description;
  DateTime updatedAt;

  factory BosconetSuccessStories.fromJson(String str) =>
      BosconetSuccessStories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BosconetSuccessStories.fromMap(Map<String, dynamic> json) => BosconetSuccessStories(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "title": title,
        "description": description,
        "updated_at": updatedAt.toIso8601String(),
      };
}
