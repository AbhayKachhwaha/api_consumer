class MetaData {
  MetaData({
    required this.totalWords,
    required this.wordCountMap,
  });

  final int? totalWords;
  final Map<String, int>? wordCountMap;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        totalWords: json["totalWords"],
        wordCountMap: Map.from(json["wordCountMap"])
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "totalWords": totalWords,
        "wordCountMap": wordCountMap != null
            ? Map.from(wordCountMap!)
                .map((k, v) => MapEntry<String, dynamic>(k, v))
            : null,
      };
}
