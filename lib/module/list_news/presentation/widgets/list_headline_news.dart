import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salt_test_project/module/detail_news/data/model/detail_news_model.dart';
import 'package:salt_test_project/module/detail_news/presentation/page/detail_news_page.dart';
import 'package:salt_test_project/module/list_news/data/model/headline_news_model.dart';
import 'package:salt_test_project/module/list_news/presentation/widgets/list_headline_card.dart';
import 'package:salt_test_project/shared/navigation/navigation.dart';

class ListHeadlineNews extends StatelessWidget with Navigation {
  final ScrollController scrollController;
  final Stream<List<HeadlineNewsValueModel>> stream;
  const ListHeadlineNews(
      {super.key, required this.stream, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshoot) {
          if (snapshoot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshoot.hasData) {
            var data = snapshoot.data ?? [];
            return ListView.builder(
                controller: scrollController,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var value = data[index];
                  if (index == data.length) {
                    return const ListTile(
                      title: CircularProgressIndicator(),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        go(context,
                            page: DetailNewsPage(
                                model: DetailNewsModel(
                                    author: value.author,
                                    title: value.title,
                                    urlToImage: value.urlToImage,
                                    content: value.content,
                                    description: value.description,
                                    publishedAt: value.publishedAt,
                                    url: value.url,
                                    source: DetailNewsSourceModel(
                                        id: value.source.id,
                                        name: value.source.name))));
                      },
                      child: ListHeadlineCard(
                          imageUrl: value.urlToImage ?? "",
                          title: value.title ?? "",
                          description: value.description ?? ""),
                    );
                  }
                });
          } else {
            return Container();
          }
        });
  }
}
