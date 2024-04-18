import 'package:flutter/material.dart';
import 'package:salt_test_project/module/detail_news/data/model/detail_news_model.dart';
import 'package:salt_test_project/module/detail_news/presentation/widgets/detail_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailNewsPage extends StatefulWidget {
  final DetailNewsModel model;
  const DetailNewsPage({super.key, required this.model});

  @override
  State<DetailNewsPage> createState() => _DetailNewsPageState();
}

class _DetailNewsPageState extends State<DetailNewsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailLayout(model: widget.model),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!await launchUrl(Uri.parse(widget.model.url ?? ""))) {
            throw Exception('Could not launch ${widget.model.url}');
          }
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
