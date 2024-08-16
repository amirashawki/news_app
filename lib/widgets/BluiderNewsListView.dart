import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import 'package:news_app_ui_setup/services/News_service.dart';
import 'package:news_app_ui_setup/views/News_listview.dart';
// cached network image

class BuilderNewsListView extends StatefulWidget {
  const BuilderNewsListView({
    required this.category,
    super.key,
  });
  final String category;
  @override
  State<BuilderNewsListView> createState() => _BuilderNewsListViewState();
}

class _BuilderNewsListViewState extends State<BuilderNewsListView> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsServier(Dio()).getNews(caTegory: widget.category);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
              child: ErrorMassage(
            error: "oops there is an error,try again later...",
          ));
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class ErrorMassage extends StatelessWidget {
  const ErrorMassage({
    required this.error,
    super.key,
  });
  final String error;

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
