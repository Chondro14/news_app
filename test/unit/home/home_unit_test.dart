import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:salt_test_project/module/list_news/presentation/cubit/headline_news_cubit.dart';
import 'package:salt_test_project/module/list_news/repository/list_news_repository.dart';
import 'package:salt_test_project/shared/constant/constants.dart';

void main() {
  group("Home for Fetch data", () {
    late HeadlineNewsCubit headlineNewsCubit;
    setUp(() {
      headlineNewsCubit = HeadlineNewsCubit();
    });
    blocTest("First load with category General",
        build: () => headlineNewsCubit,
        act: (bloc) {
          bloc.getHeadlineNews(MockClient((request) async {
            return http.Response(valueJsonHome, 200);
          }));
        },
        expect: () => [
              HeadlineLoadingState(),
              GetSuccessHeadlineNews(headlineNewsCubit.controller.stream)
            ]);

    blocTest("Infinite load with category General",
        build: () => headlineNewsCubit,
        act: (bloc) {
          bloc.incrementPage(MockClient((request) async {
            return http.Response(valueJsonHome, 200);
          }));
        },
        expect: () =>
            [GetSuccessHeadlineNews(headlineNewsCubit.controller.stream)]);

    blocTest("Failed api key need added",
        build: () => headlineNewsCubit,
        act: (bloc) {
          bloc.incrementPage(MockClient((request) async {
            return http.Response(valueJsonHomeFailed, 401);
          }));
        },
        expect: () => [
              GetFailedHeadLineNews(
                  "Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header.")
            ]);

    test("Send data to Detail News with first data", () async {
      var repository = ListNewsRepository();
      var valueData =
          await repository.getHeadlineNews(MockClient((request) async {
        return http.Response(valueJsonHome, 200);
      }), page: 1);

      expect(valueData.data[0].title,
          "Viral Efek Samping Obat Sakit Kepala Picu Anemia Aplastik, Profesor Farmasi Buka Suara - detikHealth");
    });
  });
}
