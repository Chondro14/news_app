import 'package:salt_test_project/module/list_news/data/model/headline_news_model.dart';

class BaseModel<T> {
  final String status;
  final int totalResults;
  final String? code;
  final T data;
  const BaseModel(
      {required this.status,
      required this.totalResults,
      required this.data,
      required this.code});

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
        status: json["status"],
        totalResults: json["totalResults"] ?? 0,
        data: responseGenerice<T>(json.keys.last, json),
        code: json["code"] ?? "");
  }
}

responseGenerice<T>(String key, dynamic json) {
  if (T == String) {
    return json["message"] as String;
  } else if (T == List<HeadlineNewsValueModel>) {
    return List<HeadlineNewsValueModel>.from(
        json["articles"].map((e) => HeadlineNewsValueModel.fromJson(e)));
  } else {
    throw "Undifined base model";
  }
}
