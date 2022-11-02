// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
    PostModel({
        required this.id,
        required this.caption,
        required this.media,
        required this.createdAt,
        required this.author,
        required this.spot,
        required this.numberOfComments,
        required this.numberOfLikes,
        required this.url,
    });

    final String id;
    final Caption caption;
    final List<Media> media;
    final DateTime createdAt;
    final Author author;
    final Spot spot;
    final int numberOfComments;
    final int numberOfLikes;
    final String url;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        caption: Caption.fromJson(json["caption"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        author: Author.fromJson(json["author"]),
        spot: Spot.fromJson(json["spot"]),
        numberOfComments: json["number_of_comments"],
        numberOfLikes: json["number_of_likes"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "author": author.toJson(),
        "spot": spot.toJson(),
        "number_of_comments": numberOfComments,
        "number_of_likes": numberOfLikes,
        "url": url,
    };
}

class Author {
    Author({
        required this.id,
        required this.username,
        required this.photoUrl,
        required this.fullName,
        required this.isPrivate,
        required this.isVerified,
        required this.followStatus,
    });

    final String id;
    final String username;
    final String photoUrl;
    final String fullName;
    final bool isPrivate;
    final bool isVerified;
    final String followStatus;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        photoUrl: json["photo_url"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        followStatus: json["follow_status"] == null ? null : json["follow_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "photo_url": photoUrl,
        "full_name": fullName,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "follow_status": followStatus == null ? null : followStatus,
    };
}

class Caption {
    Caption({
        required this.text,
        required this.tags,
    });

    final String text;
    final List<Tag>? tags;

    factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        text: json["text"],
        tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toJson())),
    };
}

class Tag {
    Tag({
        required this.id,
        required this.tagText,
        required this.displayText,
        required this.url,
        required this.type,
    });

    final String id;
    final String tagText;
    final String displayText;
    final String url;
    final String type;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        tagText: json["tag_text"],
        displayText: json["display_text"],
        url: json["url"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tag_text": tagText,
        "display_text": displayText,
        "url": url,
        "type": type,
    };
}

class Media {
    Media({
        required this.url,
        required this.blurHash,
        required this.type,
    });

    final String url;
    final String? blurHash;
    final TypeEnum? type;

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        url: json["url"],
        blurHash: json["blur_hash"] ?? "ecO:@Sof00j[D%offQayfQay00ay9FWBofj[fQWBfQfQD%ayofay%M",
        type: typeEnumValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "blur_hash": blurHash,
        "type": typeEnumValues.reverse[type],
    };
}

enum TypeEnum { IMAGE }

final typeEnumValues = EnumValues({
    "image": TypeEnum.IMAGE
});

class Spot {
    Spot({
        required this.id,
        required this.name,
        required this.types,
        required this.logo,
        required this.location,
        required this.isSaved,
    });

    final String id;
    final String name;
    final List<TypeElement> types;
    final Media logo;
    final Location location;
    final bool isSaved;

    factory Spot.fromJson(Map<String, dynamic> json) => Spot(
        id: json["id"],
        name: json["name"],
        types: List<TypeElement>.from(json["types"].map((x) => TypeElement.fromJson(x))),
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

    final double latitude;
    final double longitude;
    final String display;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        display: json["display"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "display": display,
    };
}

class TypeElement {
    TypeElement({
        required this.id,
        required this.name,
        required this.url,
    });

    final int id;
    final String name;
    final String url;

    factory TypeElement.fromJson(Map<String, dynamic> json) => TypeElement(
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
