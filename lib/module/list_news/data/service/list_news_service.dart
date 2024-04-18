import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:salt_test_project/core/base_model/base_model.dart';
import 'package:salt_test_project/module/list_news/data/model/headline_news_model.dart';
import 'package:salt_test_project/shared/constant/constants.dart';

class ListNewsService {
  Future<BaseModel<List<HeadlineNewsValueModel>>> getHeadlineNews(
      http.Client client,
      {String? category,
      String? country,
      required int page}) async {
    String queryCategory = category != null ? "&category=$category" : "";
    String queryCountry = country != null ? "&country=$country" : "&country=id";
    String queryPageSize = "&pageSize=10";
    String queryPage = "&page=$page";
    var url =
        "${API_BASE_URL}top-headlines?apiKey=$API_KEY$queryCountry$queryCategory$queryPageSize$queryPage";
    print(url);
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = BaseModel<List<HeadlineNewsValueModel>>.fromJson(
          jsonDecode(response.body));
      return body;
    } else if (response.statusCode > 400) {
      var body = BaseModel<String>.fromJson(jsonDecode(response.body));
      throw body.data;
    } else {
      throw "Something wrong";
    }
  }
}
