import 'package:meta/meta.dart';
import 'dart:convert';

class Img {
  Img({
    @required this.id,
    @required this.author,
    @required this.width,
    @required this.height,
    @required this.url,
    @required this.downloadUrl,
  });

  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  Img copyWith({
    String id,
    String author,
    int width,
    int height,
    String url,
    String downloadUrl,
  }) =>
      Img(
        id: id ?? this.id,
        author: author ?? this.author,
        width: width ?? this.width,
        height: height ?? this.height,
        url: url ?? this.url,
        downloadUrl: downloadUrl ?? this.downloadUrl,
      );

  factory Img.fromRawJson(String str) => Img.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
