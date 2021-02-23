import 'package:flutter/material.dart';
import 'package:nt_top_news/components/news_item.dart';
import 'package:nt_top_news/models/article_abstract.dart';

class NewsList extends StatelessWidget {
  final List<Article> newsList;
  final bool showCategory;

  const NewsList({
    @required this.newsList,
    this.showCategory = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: newsList.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        return NewsItem(
          article: newsList[index],
          showCategory: showCategory,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 5,
        );
      },
    );
  }
}