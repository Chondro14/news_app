class DetailNewsModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final DetailNewsSourceModel source;

  const DetailNewsModel(
      {required this.author,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.source});

  factory DetailNewsModel.fromJson(Map<String, dynamic> json) {
    return DetailNewsModel(
        author: json["author"] ?? "",
        content: json["content"] ?? "",
        description: json["description"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        title: json["title"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        source: DetailNewsSourceModel.fromJson(json["source"]));
  }
}

class DetailNewsSourceModel {
  final String id;
  final String name;

  const DetailNewsSourceModel({required this.id, required this.name});

  factory DetailNewsSourceModel.fromJson(Map<String, dynamic> json) {
    return DetailNewsSourceModel(
        id: json["id"] ?? "", name: json["name"] ?? "");
  }
}
