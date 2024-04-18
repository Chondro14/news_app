import 'package:salt_test_project/core/base_model/base_model.dart';
import 'package:salt_test_project/module/list_news/data/model/headline_news_model.dart';
import 'package:http/http.dart' as http;
import 'package:salt_test_project/module/list_news/data/service/list_news_service.dart';

abstract class ListNewsCase {
  Future<BaseModel<List<HeadlineNewsValueModel>>> getHeadlineNews(
      http.Client client,
      {String? category,
      String? country,
      required int page});
}

class ListNewsRepository extends ListNewsCase {
  final _service = ListNewsService();
  @override
  Future<BaseModel<List<HeadlineNewsValueModel>>> getHeadlineNews(
      http.Client client,
      {String? category,
      String? country,
      required int page}) {
    return _service.getHeadlineNews(client,
        category: category, country: country, page: page);
  }
}
