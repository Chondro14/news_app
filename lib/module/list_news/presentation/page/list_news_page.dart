import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_test_project/module/list_news/presentation/cubit/headline_news_cubit.dart';
import 'package:salt_test_project/module/list_news/presentation/widgets/list_headline_news.dart';
import 'package:http/http.dart' as http;

class ListNewsPage extends StatefulWidget {
  final String category;
  const ListNewsPage({super.key, required this.category});

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    context
        .read<HeadlineNewsCubit>()
        .getHeadlineNews(http.Client(), category: widget.category);
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = 50.0; // or something else..
      if (maxScroll - currentScroll <= delta) {
        context
            .read<HeadlineNewsCubit>()
            .incrementPage(http.Client(), category: widget.category);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<HeadlineNewsCubit>()
              .reset(http.Client(), category: widget.category);
        },
        child: BlocBuilder<HeadlineNewsCubit, HeadlineNewsState>(
          builder: (context, state) {
            print(state);
            if (state is HeadlineLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetSuccessHeadlineNews) {
              return ListHeadlineNews(
                stream: context.read<HeadlineNewsCubit>().controller.stream,
                scrollController: scrollController,
              );
            } else if (state is GetFailedHeadLineNews) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print(context.read<HeadlineNewsCubit>().controller);
                        context
                            .read<HeadlineNewsCubit>()
                            .changeCategory(http.Client(), category: "general");
                      },
                      child: const Text("Reload"))
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
