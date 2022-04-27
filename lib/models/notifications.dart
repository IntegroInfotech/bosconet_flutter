import 'dart:convert';

class Notifications {
  List<BosconetNotification> bosconetNotification;
  int success;
  String message;

  Notifications({
    required this.bosconetNotification,
    required this.success,
    required this.message,
  });

  factory Notifications.fromJson(String str) =>
      Notifications.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Notifications.fromMap(Map<String, dynamic> jsonSource) =>
      Notifications(
        bosconetNotification: List<BosconetNotification>.from(
            jsonSource["bosconet_notification"]
                .map((x) => BosconetNotification.fromMap(x))),
        success: jsonSource["success"],
        message: jsonSource["message"],
      );

  Map<String, dynamic> toMap() => {
        "bosconet_notification":
            List<dynamic>.from(bosconetNotification.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class BosconetNotification {
  String id;
  String title;
  String date;
  String description;
  DateTime updatedAt;

  BosconetNotification({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.updatedAt,
  });

  factory BosconetNotification.fromJson(String str) =>
      BosconetNotification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BosconetNotification.fromMap(Map<String, dynamic> jsonSource) =>
      BosconetNotification(
        id: jsonSource["id"],
        title: jsonSource["title"],
        date: jsonSource["date"],
        description: jsonSource["description"],
        updatedAt: DateTime.parse(jsonSource["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "date": date,
        "description": description,
        "updated_at": updatedAt.toIso8601String(),
      };
}
