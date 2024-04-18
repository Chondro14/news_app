class HeadlineNewsModel {
  final String status;
  final int totalResults;
  final List<HeadlineNewsValueModel> articles;
  const HeadlineNewsModel(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory HeadlineNewsModel.fromJson(Map<String, dynamic> json) {
    return HeadlineNewsModel(
        status: json["status"] ?? "",
        totalResults: json["totalResults"] ?? 0,
        articles: List<HeadlineNewsValueModel>.from(
                json["articles"].map((e) => HeadlineNewsValueModel.fromJson(e)))
            .toList());
  }
}

class HeadlineNewsValueModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final HeadlineNewsSourceModel source;

  const HeadlineNewsValueModel(
      {required this.author,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.source});

  factory HeadlineNewsValueModel.fromJson(Map<String, dynamic> json) {
    return HeadlineNewsValueModel(
        author: json["author"] ?? "",
        content: json["content"] ?? "",
        description: json["description"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        title: json["title"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        source: HeadlineNewsSourceModel.fromJson(json["source"]));
  }
}

class HeadlineNewsSourceModel {
  final String id;
  final String name;

  const HeadlineNewsSourceModel({required this.id, required this.name});

  factory HeadlineNewsSourceModel.fromJson(Map<String, dynamic> json) {
    return HeadlineNewsSourceModel(
        id: json["id"] ?? "", name: json["name"] ?? "");
  }
}
