import 'dart:convert';

import 'MetaData.dart';
import 'Source.dart';

List<Article> articleFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articleToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
  Article({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.source,
    required this.metaData,
  });

  String title;
  String description;
  String content;
  String url;
  String image;
  DateTime publishedAt;
  Source source;
  MetaData metaData;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        description: json["description"],
        content: json["content"],
        url: json["url"],
        image: json["image"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        source: Source.fromJson(json["source"]),
        metaData: MetaData.fromJson(json["metaData"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "content": content,
        "url": url,
        "image": image,
        "publishedAt": publishedAt.toIso8601String(),
        "source": source.toJson(),
        "metaData": metaData.toJson(),
      };
}
