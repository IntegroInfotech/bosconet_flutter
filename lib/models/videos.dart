import 'dart:convert';

class Videos {
  Videos({
    required this.bosconetVideos,
    required this.success,
    required this.message,
  });

  List<BosconetVideo> bosconetVideos;
  int success;
  String message;

  factory Videos.fromJson(String str) => Videos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Videos.fromMap(Map<String, dynamic> json) => Videos(
        bosconetVideos: List<BosconetVideo>.from(
            json["bosconet_videos"].map((x) => BosconetVideo.fromMap(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "bosconet_videos":
            List<dynamic>.from(bosconetVideos.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class BosconetVideo {
  BosconetVideo({
    required this.id,
    required this.title,
    required this.vId,
    required this.updatedAt,
  });

  String id;
  String title;
  String vId;
  DateTime updatedAt;

  factory BosconetVideo.fromJson(String str) =>
      BosconetVideo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BosconetVideo.fromMap(Map<String, dynamic> json) => BosconetVideo(
        id: json["id"],
        title: json["title"],
        vId: json["v_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "v_id": vId,
        "updated_at": updatedAt.toIso8601String(),
      };
}
