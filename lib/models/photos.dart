import 'dart:convert';

class Photos {
  Photos({
    required this.photoimages,
    required this.success,
    required this.message,
  });

  List<BosconetPhotos> photoimages;
  int success;
  String message;

  factory Photos.fromJson(String str) => Photos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Photos.fromMap(Map<String, dynamic> json) => Photos(
    photoimages: List<BosconetPhotos>.from(json["photoimages"].map((x) => BosconetPhotos.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "photoimages": List<dynamic>.from(photoimages.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class BosconetPhotos {
  BosconetPhotos({
    required this.id,
    required this.pId,
    required this.image,
    required this.updatedAt,
  });

  String id;
  String pId;
  String image;
  DateTime updatedAt;

  factory BosconetPhotos.fromJson(String str) => BosconetPhotos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BosconetPhotos.fromMap(Map<String, dynamic> json) => BosconetPhotos(
    id: json["id"],
    pId: json["p_id"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "p_id": pId,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
  };
}
