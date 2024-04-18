import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:salt_test_project/shared/style/textstyle.dart';

import '../../data/model/detail_news_model.dart';

class DetailLayout extends StatelessWidget {
  final DetailNewsModel model;
  const DetailLayout({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: model.url ?? "",
            imageBuilder: (context, imageProvider) => Container(
              height: 72,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(image: imageProvider)),
            ),
            placeholder: (context, url) =>
                SizedBox(height: 72, child: const Icon(Icons.image)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            model.title ?? "",
            style:
                montserat.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.source.name,
                    style: montserat.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    model.author ?? "",
                    style: montserat.copyWith(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Ikuti",
                    style: montserat.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ))
            ],
          ),
          model.content!.isNotEmpty && model.description!.isNotEmpty
              ? Text(model.content ?? "")
              : SizedBox(
                  height: 80,
                  child: Center(
                    child: Text(
                      "Tidak ada konten",
                      style: montserat.copyWith(
                          fontSize: 13, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
