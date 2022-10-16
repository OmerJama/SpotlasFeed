import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  String id;
  Caption caption;
  List<Media> media;
  DateTime createdAt;
  Author author;
  Spot spot;

  PostModel({
    required this.id,
    required this.caption,
    required this.media,
    required this.createdAt,
    required this.author,
    required this.spot,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        caption: Caption.fromJson(json["caption"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        author: Author.fromJson(json["author"]),
        spot: Spot.fromJson(json["spot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "author": author.toJson(),
        "spot": spot.toJson(),
      };
}

class Author {
  Author({
    required this.id,
    required this.username,
    required this.photoUrl,
    required this.fullName,
  });

  String id;
  String username;
  String photoUrl;
  String fullName;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        photoUrl: json["photo_url"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "photo_url": photoUrl,
        "full_name": fullName,
      };
}

class Caption {
  Caption({
    required this.text,
  });

  String text;

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class Media {
  Media({
    required this.url,
    required this.blurHash,
    required this.type,
  });

  String url;
  String blurHash;
  String type;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        url: json["url"],
        blurHash: json["blur_hash"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "blur_hash": blurHash,
        "type": type,
      };
}

class Spot {
  Spot({
    required this.id,
    required this.name,
    required this.types,
    required this.logo,
    required this.location,
    required this.isSaved,
  });

  String id;
  String name;
  List<Type> types;
  Media logo;
  Location location;
  bool isSaved;

  factory Spot.fromJson(Map<String, dynamic> json) => Spot(
        id: json["id"],
        name: json["name"],
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        logo: Media.fromJson(json["logo"]),
        location: Location.fromJson(json["location"]),
        isSaved: json["is_saved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "logo": logo.toJson(),
        "location": location.toJson(),
        "is_saved": isSaved,
      };
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
    required this.display,
  });

  int latitude;
  int longitude;
  String display;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
        display: json["display"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "display": display,
      };
}

class Type {
  Type({required this.id, required this.name, required this.url, required});

  int id;
  String name;
  String url;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}
