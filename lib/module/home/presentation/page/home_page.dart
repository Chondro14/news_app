import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_test_project/module/home/data/model/category_model.dart';
import 'package:salt_test_project/module/list_news/presentation/cubit/headline_news_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:salt_test_project/module/list_news/presentation/page/list_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var valueCategory = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: TabBar(
              isScrollable: true,
              tabs: List.generate(
                  5,
                  (index) => Tab(
                        text: categories[index].title,
                      )),
              onTap: (index) {
                setState(() {
                  valueCategory = categories[index].value;
                });
                context.read<HeadlineNewsCubit>().changeCategory(http.Client(),
                    category: categories[index].value);
              },
            ),
          ),
        ),
        body: ListNewsPage(
          category: valueCategory,
        ),
      ),
    );
  }
}
