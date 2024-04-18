import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_test_project/module/list_news/data/model/headline_news_model.dart';
import 'package:http/http.dart' as http;
import 'package:salt_test_project/module/list_news/repository/list_news_repository.dart';

part '../state/headline_news_state.dart';

class HeadlineNewsCubit extends Cubit<HeadlineNewsState> {
  late StreamController<List<HeadlineNewsValueModel>> controller =
      StreamController<List<HeadlineNewsValueModel>>();
  int page = 1;
  int maxPage = 1;
  List<HeadlineNewsValueModel> headlines = [];
  String categorySaved = "general";
  var repository = ListNewsRepository();
  HeadlineNewsCubit() : super(HeadlineInitialState());

  void getHeadlineNews(
    http.Client client, {
    String? category,
    String? country,
  }) async {
    try {
      emit(HeadlineLoadingState());
      getData(client, category: category, country: country);
    } catch (e) {
      emit(GetFailedHeadLineNews(e.toString()));
    }
  }

  void reset(
    http.Client client, {
    String? category,
    String? country,
  }) async {
    page = 1;
    headlines.clear();
    controller.sink.add(headlines);
    emit(GetSuccessHeadlineNews(controller.stream));
    getData(client, category: category, country: country);
  }

  void getData(
    http.Client client, {
    String? category,
    String? country,
  }) async {
    var value = await repository.getHeadlineNews(client,
        page: page, category: category, country: country);
    headlines.addAll(value.data);
    maxPage = (value.totalResults.toDouble() / 20.toDouble()).ceil();
    controller.sink.add(headlines);
    emit(GetSuccessHeadlineNews(controller.stream));
  }

  void changeCategory(
    http.Client client, {
    String? category,
    String? country,
  }) async {
    categorySaved = category ?? "general";
    page = 1;
    headlines.clear();
    controller.sink.add(headlines);
    getData(client, category: category, country: country);
  }

  void incrementPage(
    http.Client client, {
    String? category,
    String? country,
  }) async {
    try {
      page += 1;
      print("$page <= $maxPage ${page <= maxPage}");
      if (page <= maxPage + 2) {
        var value = await repository.getHeadlineNews(client,
            page: page, category: category, country: country);
        print(value.data.length);
        headlines.addAll(value.data);
        controller.sink.add(headlines);
        emit(GetSuccessHeadlineNews(controller.stream));
      }
    } catch (e) {
      emit(GetFailedHeadLineNews(e.toString()));
    }
  }
}
