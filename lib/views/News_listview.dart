import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import 'package:news_app_ui_setup/widgets/News_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({
    required this.articles,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return NewsTile(
        articleModel: articles[index],
      );
    }));
  }
}
