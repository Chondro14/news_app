import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salt_test_project/shared/style/textstyle.dart';

class ListHeadlineCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  const ListHeadlineCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => Icon(Icons.image),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: montserat.copyWith(fontSize: 16),
                  maxLines: 2,
                ),
                Text(
                  description,
                  style: montserat.copyWith(fontSize: 11),
                  maxLines: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
